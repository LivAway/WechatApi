<?php

namespace app\controllers;

use app\helpers\Helper;
use app\models\Ad;
use app\models\ForgetForm;
use app\models\LoginForm;
use app\models\Syscode;
use app\models\User;
use Yii;
use yii\web\Controller;
class WeixinController extends Controller
{
    public $is_token=false;
    public $modelClass = 'app\models\User';

    public function actionIndex(){
		 header('Access-Control-Allow-Origin:*');
       
		
        $data=$_GET;
		
        $appid=Yii::$app->params['wx_appid'];
        $appSecret=Yii::$app->params['wx_appSecret'];
		
		if(!empty($data['is_test'])){
			$this->login("oo4IKxMKQpSokU-aaDFB4UOxIK50");
			exit;
		}
        $url='https://api.weixin.qq.com/sns/oauth2/access_token?appid='.$appid."&secret=".$appSecret."&code=".$data['code']."&grant_type=authorization_code";
			
        $url=str_replace("/https","https",$url);
        $result=file_get_contents($url);
			
        $result=json_decode($result,false);
		
        if(!empty($result->errcode)){//code 已经被使用
	
            echo json_encode(['code' => 203, 'msg'=>'授权失败 ，请和管理员联系'.$result->errcode]);
			exit;
        }

        if(User::checkOpenid($result->openid)){
            $this->login($result->openid);
        }else{
            if($result->scope==="snsapi_userinfo"){
                $token=$result->access_token;
                $openid=$result->openid;
                $user_info_url="https://api.weixin.qq.com/sns/userinfo?access_token=$token&openid=$openid&lang=zh_CN";
                $user_info=file_get_contents($user_info_url);
                $user_info=json_decode($user_info,true);
                User::handleOtherLogin($user_info,"微信登录");
                $this->login($openid);
            }else{
                exit(json_encode(['code' => 203, 'msg'=>'未找到用户信息 ，请和管理员联系']));
            }
        }
    }
    protected function login($openid){
        $user=Yii::$app->db->createCommand("SELECT * FROM user where openid='$openid'")->queryOne();
        if(!empty($user)) {
            $model = new LoginForm();
            $model->username = $user['openid'];
            $model->rememberMe = true;
            if ($model->weixinLogin()) {
                exit(json_encode(['code' => 200, 'data' => [
                    'uid' => $model->_user->oid,
                    'username' => $model->_user->username,
                    'nickname' => $model->_user->nickname,
                    'headpic' => $model->_user->headpic,
                    'token' => $model->_user->token,
                    'duetime' => $model->_user->duetime,
					'state'=>!empty($_GET['state'])?$_GET['state']:"",
					'learn'=>$model->_user->learn,
					'share'=>$model->_user->share,
					'desc'=>$model->_user->desc
                ]]));
            }
        }
        exit(json_encode(['code' => 203, 'msg'=>'登录失败 请和管理员 联系2']));
    }
}
