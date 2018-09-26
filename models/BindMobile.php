<?php

namespace app\models;

use app\helpers\Helper;
use Yii;
use yii\base\Model;

/**
 * LoginForm is the model behind the login form.
 */
class BindMobile extends Model
{
    public $mobile;
    public $verifyCode;
    public $mobileverifyCode;


    public function scenarios()
    {
        return [
            'changes' => ['mobile', 'verifyCode'],
            'bind' => ['mobile', 'mobileverifyCode'],
        ];
    }
    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            [['mobile'], 'required','on'=>['bind','changes']],
            [['verifyCode'], 'required','on'=>['changes']],
            [['verifyCode'],'string', 'max'=>4,'on'=>['changes']],
            [['mobileverifyCode'],'string', 'max'=>6,'on'=>['bind']],
            ['verifyCode', 'captcha','captchaAction'=>'site/captcha','on'=>['changes']],
        ];
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
            'mobile' => '手机号',
            'verifyCode' => '验证码',
            'mobileverifyCode'=>'手机验证码'
        ];
    }

    public function sendMeaage(){
        $this->setScenario('changes');
        if($this->validate()){
            $model=new SysCode();
            $model->vcode=rand(100000,999999);
            $time=time();
            $exptime=Yii::$app->params['send_mail_expires'];
            $model->duetime=$time+$exptime*60;
            $model->type=4;
            $model->number=$this->mobile;
            $model->createdtime=$time;
            if($model->save()){
                $content="用户绑定手机,验证码为：".$model->vcode."有效期:".Yii::$app->params['send_mail_expires']."分钟";
                return Helper::sendSMS($model->number,$content);
            }else{
                return false;
            }
        }else{
            return false;
        }
    }

    public function change(){
        if ($this->validate()) {
            if($this->mobileverifyCode==""){
                $this->addError("mobileverifyCode", '手机号验证码不能为空');
                return false;
            }else{
                $result=Yii::$app->db->createCommand("select * from syscode WHERE number='".$this->mobile."' AND code='".$this->mobileverifyCode."' AND type=2 AND send_type=0 AND is_use=0")->queryOne();
                $time=time();
                if(empty($result)){
                    $this->addError("mobileverifyCode", '验证码错误，请重新输入');
                    return false;
                }
                if($result['expire_time']<$time){
                    $this->addError("mobileverifyCode", '验证码已经过期，请重新获取');
                    return false;
                }
                $connection=Yii::$app->db;
                $transaction = $connection->beginTransaction();
                try {
                    $user=Yii::$app->user->identity;
                    $sqll="update user set mobile ='".$this->mobile."' WHERE oid=".$user->getId();
                    $connection->createCommand($sqll)->execute();
                    $connection->createCommand("update syscode set is_use=1 WHERE type=2 AND send_type=0 AND number='".$this->mobile."' AND code=".$result['code'])->execute();
                    $connection->createCommand("delete from syscode WHERE type=2 AND send_type=0 AND number='".$this->mobile."' AND code<>'".$result['code']."'")->execute();
                    $transaction->commit();
                } catch (Exception $e) {
                    $this->addError("mobileverifyCode", '验证码错误，请重新输入');
                    return false;
                }
                return true;
            }
        }else{
            return false;
        }
    }
}
