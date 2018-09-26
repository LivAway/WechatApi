<?php

namespace app\models;

use Yii;
use yii\base\Model;

/**
 * LoginForm is the model behind the login form.
 */
class BindMail extends Model
{
    public $email;
    public $verifyCode;
    public $mailverifyCode;


    public function scenarios()
    {
        return [
            'changes' => ['email', 'verifyCode'],
            'bind' => ['email', 'mailverifyCode'],
        ];
    }
    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            [['email'], 'required','on'=>['bind','changes']],
            [['verifyCode'], 'required','on'=>['changes']],
            [['verifyCode'],'string', 'max'=>4,'on'=>['changes']],
            [['mailverifyCode'],'string', 'max'=>6,'on'=>['bind']],
            ['verifyCode', 'captcha','captchaAction'=>'site/captcha','on'=>['changes']],
        ];
    }

    public function validateEmail($attribute, $params)
    {
        if (!$this->hasErrors()) {
            $model=Users::find()->where(['email'=>$this->email,'is_valid'=>1])->andWhere("oid<>".Yii::$app->user->id)->one();
            if (!empty($model)) {
                $this->addError("email", '邮箱已经被使用，请更换别的邮箱');
            }
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
            'email' => '邮箱地址',
            'verifyCode' => '验证码',
            'mailverifyCode'=>'邮箱验证码'
        ];
    }

    public function sendMail(){
        $this->setScenario('changes');
        if($this->validate()){
            $model=new SysCode();
            $model->vcode=rand(100000,999999);
            $time=time();
            $exptime=Yii::$app->params['send_mail_expires'];
            $model->duetime=$time+$exptime*60;
            $model->type=3;
            $model->number=$this->email;
            $model->createdtime=$time;
            if($model->save()){
                $mail= Yii::$app->mailer->compose('tpl_bindmail',['email'=>$model->number,'code'=>$model->vcode]); //加载模板这样写：$mail= Yii::$app->mailer->compose('moban',['key'=>'value']);
                $mail->setTo($model->number);
                $mail->setSubject("绑定邮箱");
                return $mail->send();
            }else{
                return false;
            }
        }else{
            return false;
        }
    }

    public function change(){
        
        if ($this->validate()) {
            if($this->mailverifyCode==""){
                $this->addError("mailverifyCode", '邮箱验证码不能为空');
                return false;
            }else{
                $result=Yii::$app->db->createCommand("select * from syscode WHERE number='".$this->email."' AND code='".$this->mailverifyCode."' AND type=3 AND send_type=1 AND is_use=0")->queryOne();
                $time=time();
                if(empty($result)){
                    $this->addError("mailverifyCode", '验证码错误，请重新输入');
                    return false;
                }
                if($result['expire_time']<$time){
                    $this->addError("mailverifyCode", '验证码已经过期，请重新获取');
                    return false;
                }
                $connection=Yii::$app->db;
                $transaction = $connection->beginTransaction();
                try {
                    $user=Yii::$app->user->identity;
                    $sqll="update user set email ='".$this->email."' WHERE oid=".$user->getId();
                    $connection->createCommand($sqll)->execute();
                    $connection->createCommand("update syscode set is_use=1 WHERE type=3 AND send_type=1 AND number='".$this->email."' AND code=".$result['code'])->execute();
                    $connection->createCommand("delete from syscode WHERE type=3 AND send_type=1 AND number='".$this->email."' AND code<>'".$result['code']."'")->execute();
                    $transaction->commit();
                } catch (Exception $e) {
                    $this->addError("emailverifyCode", '验证码错误，请重新输入');
                    return false;
                }
                return true;
            }
        }else{
            return false;
        }
    }
}
