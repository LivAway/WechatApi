<?php
namespace app\commands;
use app\models\AuthUser;
use Yii;
use yii\rest\ActiveController;
class BaseActiveController extends ActiveController{
    public $is_token=true;
    protected $formatType = 'json';
    public $post = null;
    public $get = null;
    public $user = null;
    public $userId = null;
    public $params=[];
    public $params_get=[];
    public function init()
    {
        parent::init();
        Yii::$app->user->enableSession = false;
        $this->enableCsrfValidation=false;
        header('Access-Control-Allow-Origin:*');
        header('Access-Control-Allow-Methods:POST');
        header('Access-Control-Allow-Headers:x-requested-with,content-type');
        $params=yii::$app->request->post();

        $params_get=yii::$app->request->get();
        if(isPresent($params)){
            $params_get = array_merge($params_get,$params);
        }
        $this->params_get = $params_get;

        if(!empty($params['data'])){
            $json=json_decode($params['data'],true);
            $this->params=$json;
        }
    }
    public function actions()
    {
        $actions = parent::actions();
        return "";
    }
    public function behaviors()
    {
        $behaviors = parent::behaviors();
        if($this->is_token){//是否验证token
            $behaviors['authenticator'] = [
                'class' => AuthUser::className(),
                'tokenParam' => 'token'  //例如改为‘token’
            ];
        }
        //  数据返回类型设置
        $behaviors['contentNegotiator']['formats']['application/json'] =$this->formatType;
        $behaviors['contentNegotiator']['formats']['application/xml'] = $this->formatType;

        return $behaviors;
    }
    public function beforeAction($action)
    {
        parent::beforeAction($action);
        if($this->is_token){//是否验证token
            $this->user = yii::$app->user->identity;
            $this->userId = Yii::$app->user->id;
        }
        return $action;
    }

    protected function getData($key,$required=false){
        $params=$this->params;
        if($required){
            if(isset($params[$key])){
                return $params[$key];
            }else{
                exit( json_encode(["code"=>304,"msg"=>"参数：".$key."必须填写"]));
            }
        }else{
            return isset($params[$key])?$params[$key]:"";
        }
    }
}