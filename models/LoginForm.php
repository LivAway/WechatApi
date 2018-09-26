<?php

namespace app\models;

use Yii;
use yii\base\Model;

/**
 * LoginForm is the model behind the login form.
 */
class LoginForm extends Model {

    public $username;
    public $password;
    public $rememberMe = false;
    public $_user = false;
    /**
     * @return array the validation rules.
     */
    public function rules() {
        return [
            // username and password are both required
            [['username', 'password'], 'required'],
            ['password', 'string', 'min' => 6, "max" => 100],
            ['username', 'string', 'min' => 2, 'max' => 30],
            ['rememberMe', 'boolean'],
            ['username', 'validateusername'],
            ['password', 'validatePassword'],
        ];
    }

    /**
     * Validates the password.
     * This method serves as the inline validation for password.
     *
     * @param string $attribute the attribute currently being validated
     * @param array $params the additional name-value pairs given in the rule
     */
    public function validatePassword($attribute, $params) {
        if (!$this->hasErrors()) {
            $user = $this->getUser();
            if (empty($user)) {
                $this->addError("username", '用户名不存在');
            }elseif (!$user->validatePassword($this->password)) {
                $this->addError("password", '密码错误，请重新输入');
            }elseif($user->isvalid==0){
                $this->addError("username", '用户已经被屏蔽，请和管理员联系！！！');
            }
        }
    }

    public function validateUsername($attribute, $params) {
//        $reg ='/^1[3|4|5|6|7|9|8][0-9]\d{8}$/';
//        $regEmail ='/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/';
//        if(!preg_match($reg,$this->username) && !preg_match($regEmail,$this->username)) {
//            $this->addError("username", '用户名必须是手机号或者邮箱');
//        }
    }
    /**
     * Logs in a user using the provided username and password.
     * @return boolean whether the user is logged in successfully
     */
    public function login() {
        if ($this->validate()) {
            if (Yii::$app->user->login($this->getUser(), $this->rememberMe ? 3600 * 24 * 30 : 0)) {
                //登录后执行
                $this->_user->generateToken();
                $user_id=$this->_user->oid;
                if($this->rememberMe){
                    $expires_in=Yii::$app->params['token_expire'];
                }else{
                    $expires_in=Yii::$app->params['remeber_token_expire'];
                }
                $time=time();
                $token=$this->_user->token;
                $is_update=$this->rememberMe;
                $duetime=$time+$expires_in;
                $createdtime=$time;
                Yii::$app->db->createCommand("insert into auth_token(user_id,token,is_update,expires_in,duetime,createdtime) VALUE ($user_id,'$token',$is_update,$expires_in,$duetime,$createdtime)")->execute();
                $this->_user->duetime=$duetime;
                return true;
            } else {
                return false;
            }
        }
        return false;
    }

    public function weixinLogin(){


        if (Yii::$app->user->login($this->getUser(), $this->rememberMe ? 3600 * 24 * 30 : 0)) {
            //登录后执行
            $this->_user->generateToken();
            $user_id=$this->_user->oid;
            if($this->rememberMe){
                $expires_in=Yii::$app->params['token_expire'];
            }else{
                $expires_in=Yii::$app->params['remeber_token_expire'];
            }
            $time=time();
            $token=$this->_user->token;
            $is_update=$this->rememberMe;
            $duetime=$time+$expires_in;
            $createdtime=$time;
            Yii::$app->db->createCommand("insert into auth_token(user_id,token,is_update,expires_in,duetime,createdtime) VALUE ($user_id,'$token',$is_update,$expires_in,$duetime,$createdtime)")->execute();
            $this->_user->duetime=$duetime;
            return true;
        } else {
            return false;
        }
    }

    //根据邮箱和密码查询数据库  
    public function getUser() {
        if ($this->_user === false) {
            $this->_user = User::findByUserName($this->username);
        }
        return $this->_user;
    }
}
