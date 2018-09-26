<?php

namespace app\models;

use MongoDB\Driver\Exception\Exception;
use Yii;
use yii\base\Model;

/**
 * LoginForm is the model behind the login form.
 */
class RegForm extends Model
{
    public $username;
    public $regCode;
    public $password;
    public $repassword;
    public $verifyCode;


    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            [['username','password','repassword','regCode'], 'required'],
//            [['verifyCode'],'string', 'max'=>4],
            [['password','repassword'],'string', 'max'=>25,'min'=>6],
            [['regCode'],'string', 'max'=>6,'min'=>6],
            [['username'],'string', 'max'=>50,'min'=>2],
            ['repassword', 'compare', 'compareAttribute'=>'password'],
          //  ['verifyCode', 'captcha','captchaAction'=>'member/captcha'],
            ['username', 'validateUsername'],
        ];
    }

    public function validateUsername($attribute, $params)
    {
        if (!$this->hasErrors()) {
            $username=$this->username;
            $model=User::find()->where('(username="'.$username.'" or mobile="'.$username.'" or email="'.$username.'") AND isvalid=1')->one();
            if (!empty($model)) {
                $this->addError("username", '用户名已经被注册');
            }
        }
    }

    public function save(){
        if($this->validate()){
            $result=Yii::$app->db->createCommand("select * from syscode WHERE number=".$this->username." AND code=".$this->regCode." AND type=0 AND is_use=0")->queryOne();
            $time=time();
            if(empty($result)){
                $this->addError("regCode", '验证码错误，请重新输入');
                return false;
            }
            if($result['expire_time']<$time){
                $this->addError("regCode", '验证码已经过期，请重新获取');
                return false;
            }
            $connection=Yii::$app->db;
            $transaction = $connection->beginTransaction();
            $source=0;//注册设备[search][list]0:PC|1:Android|2:IOS|3:Mobile
            try {
                $password=\app\models\User::getSalt($this->password);
                $sqll="INSERT INTO user(username,password,isvalid,mobile,reg_time,reg_source) VALUES (\"$this->username\",\"$password\",1,\"$this->username\",$time,$source)";
                $connection->createCommand($sqll)->execute();
                $connection->createCommand("update syscode set is_use=1 WHERE type=0 AND number='".$result['number']."' AND code=".$result['code'])->execute();
                $connection->createCommand("delete from syscode WHERE type=0 AND number='".$result['number']."' AND code<>".$result['code'])->execute();
                //$uid=Yii::$app->db->getLastInsertID();
                $transaction->commit();
            } catch (Exception $e) {
                $this->addError("regCode", '验证码错误，请重新输入');
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
            'regCode'=>'验证码',
            'password'=>'密码',
            'repassword'=>'重复密码'
        ];
    }

}
