<?php

namespace app\models;

use MongoDB\Driver\Exception\Exception;
use Yii;
use yii\base\Model;

/**
 * LoginForm is the model behind the login form.
 */
class ForgetForm extends Model
{
    public $username;
    public $verifyCode;
    public $password;
    public $repassword;
    public $findCode;

    public function scenarios()
    {
        return [
            'one' => ['username', 'verifyCode'],
            'two' => ['username', 'findCode'],
            'three' => ['username', 'password', 'repassword', 'findCode']
        ];
    }


    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            [['username','verifyCode'], 'required','on'=>'one'],
            ['verifyCode', 'captcha','on'=>'one'],
            [['verifyCode'],'string', 'max'=>4,'on'=>'one'],
            ['username', 'validateUsername','on'=>['one','two','three']],
            ['findCode','required','on'=>'two'],
            [['findCode'],'string', 'max'=>6,'min'=>6,'on'=>'two'],
            ['findCode','validataFindCode','on'=>['two','three']],
            [['username','password','repassword','findCode'], 'required','on'=>'three'],
            [['password','repassword'],'string', 'max'=>25,'min'=>6,'on'=>'three'],
            ['repassword', 'compare', 'compareAttribute'=>'password','on'=>'three'],
//            [['verifyCode'],'string', 'max'=>4],
//
//
//            [['username'],'string', 'max'=>50,'min'=>2],
//
//            ['verifyCode', 'captcha','captchaAction'=>'member/captcha'],
//
        ];
    }
    public function validateUsername($attribute, $params) {
        $reg ='/^1[3|4|5|6|7|9|8][0-9]\d{8}$/';
        $regEmail ='/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/';
        if(!preg_match($reg,$this->username) && !preg_match($regEmail,$this->username)) {
            $this->addError("username", '用户名必须是手机号或者邮箱');
        }

        if (!$this->hasErrors()) {
            $username=$this->username;
            $model=User::find()->where('(mobile="'.$username.'" or email="'.$username.'") AND isvalid=1')->one();
            if (empty($model)) {
                $this->addError("username", '未找到用户信息或者手机邮箱输入有误.');
            }
        }
    }

    public function validataFindCode($attribute, $params) {
        if (!$this->hasErrors()) {
            $time=time();
            $findCode=Syscode::getCode($this->username,$this->findCode,1);
            if(empty($findCode)){
                $this->addError("findCode", '验证码输入错误，请重新再试.');
            }elseif($findCode->is_use==1){
                $this->addError("findCode", '验证码已经被使用，请重新获取.');
            }elseif($findCode->expire_time<$time){
                $this->addError("findCode", '验证码已经过期，请重新获取.');
            }
        }
    }



    public function save(){
        if($this->validate()){
            $connection=Yii::$app->db;
            $transaction = $connection->beginTransaction();
            $user=User::findByUser($this->username);
            if(empty($user)){
                $this->addError("username", '用户信息不存在或者手机邮箱有误，请重新再试.');
                return false;
            }
            $time=time();
            try {
                $password=\app\models\User::getSalt($this->password);
                $connection->createCommand("update user set password='$password' WHERE oid=".$user->oid)->execute();
                $connection->createCommand("update syscode set is_use=1 WHERE type=1 AND number='".$this->username."' AND code=".$this->findCode)->execute();
                $connection->createCommand("delete from syscode WHERE type=1 AND number='".$this->username."' AND code<>".$this->findCode)->execute();
                //$uid=Yii::$app->db->getLastInsertID();
                $transaction->commit();
            } catch (Exception $e) {
                $this->addError("findCode", '验证码错误，请重新输入');
                return false;
            }
            return true;
        }else{
            return false;
        }
    }

    /**
     * Logs in a user using the provided username and password.
     * @return boolean whether the user is logged in successfully
     */

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'username' => '用户名',
            'verifyCode' => '验证码',
            'findCode'=>'验证码',
            'password'=>'新登录密码',
            'repassword'=>'确认新密码'
        ];
    }

}
