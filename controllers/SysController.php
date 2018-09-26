<?php

namespace app\controllers;

use app\commands\BaseActiveController;
use app\helpers\Helper;
use app\models\Ad;
use app\models\ForgetForm;
use app\models\Syscode;
use app\models\User;
use Yii;
class SysController extends BaseActiveController
{
    public $is_token=false;
    public $modelClass = 'app\models\User';
    public function actionSendcode(){
        $number=$this->getData('number');
        $type=$this->getData('type');
        if(empty($number)){
            return ['code'=>204,'msg'=>"请填写手机号或者邮箱"];
        }
        if(!Helper::checkMobileEmail($number)){
            return ['code'=>204,'msg'=>"手机或者邮箱输入有误."];
        }


        if($type==0){//注册
            $count=Yii::$app->db->createCommand("select count(oid) from user WHERE (username = '$number' or mobile='$number' or email='$number') ")->queryScalar();
            if($count>0){
                return ['code'=>204,'msg'=>"手机号已经被注册，请输入新的手机号."];
            }
        }else{//找回密码
            $user=User::findByUser($number);
            if(empty($user)){
                return ['code'=>204,'msg'=>"用户信息未找到."];
            }
        }
        $s=Syscode::checkSendCode($number,$type);
        if($s>0){
            return ['code'=>204,'msg'=>$s."秒内不能获取验证码.请稍后再试"];
        }
        $code=Syscode::sendCode($number,$type);
        if($code<>false){
            return ['code'=>200,'msg'=>"验证码为:$code"];
        }else{
            return ['code'=>204,'msg'=>"验证码发送失败，请联系管理员"];
        }
    }
    public function actionChangpwd(){
        $number=$this->getData('number');
        $code=$this->getData('findcode');
        $password=$this->getData('password');
        $repassword=$this->getData('repassword');
        $model = new ForgetForm();
        $model->username=$number;
        $model->password=$password;
        $model->repassword=$repassword;
        $model->findCode=$code;
        $model->setScenario('three');
        if($model->save()){
            return ["code"=>200];
        }else{
            $error=$model->errors;
            if(array_key_exists("username",$error)){
                $msg=$error['username'][0];
                $code=504;
            }elseif(array_key_exists("password",$error)){
                $msg=$error['password'][0];
                $code=505;
            }elseif(array_key_exists("repassword",$error)){
                $msg=$error['repassword'][0];
                $code=606;
            }else{
                $msg=$error['findCode'][0];
                $code=507;
            }
            return ['code'=>$code,'msg'=>$msg];
        }
    }

    public function actionAd(){
        $limit=$this->getData("limit");
        $cate=$this->getData("cate");
        if(!empty($limit) && !empty($cate)){
            $result=Ad::getAds($cate,$limit,true);
            if(!empty($result)){
                return [
                    'code'=>200,
                    'data'=>['list'=>$limit==1?[$result]:$result]
                ];
            }else{
                return [
                    'code'=>200,
                    'data'=>['list'=>[]]
                ];
            }

        }else{
            return [
                'code'=>200,
                'data'=>['list'=>[]]
            ];
        }
    }
}
