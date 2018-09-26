<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "syscode".
 *
 * @property string $oid
 * @property string $number
 * @property string $code
 * @property integer $is_use
 * @property string $expire_time
 * @property string $created_time
 * @property string $type
 * @property static $send_type
 */
class Syscode extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'syscode';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['is_use', 'expire_time', 'created_time','type'], 'integer'],
            [['number'], 'string', 'max' => 50],
            [['code'], 'integer'],
            [['send_type','type'],'safe']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'oid' => 'Oid',
            'number' => 'Number',
            'code' => 'Code',
            'is_use' => 'Is Use',
            'expire_time' => 'Expire Time',
            'created_time' => 'Created Time',

        ];
    }

    public static function sendCode($number,$type=0){
        $reg ='/^1[3|4|5|6|7|9|8][0-9]\d{8}$/';
        $stype=1;
        if(preg_match($reg,$number)) {
           $stype=0;
        }
        $model=new SysCode();
        $model->code=rand(100000,999999);
        $time=time();
        $exptime=Yii::$app->params['send_code_expires'];
        $model->expire_time=$time+$exptime*60;
        $model->number=$number;
        $model->created_time=$time;
        $model->is_use=0;
        $model->type=$type;
        $model->send_type=$stype;
        if($model->save()){
            $content="验证码为：".$model->code."有效期:".Yii::$app->params['send_code_expires']."分钟";
            // Helper::sendSMS($model->number,$content);
            return $model->code;
        }else{
            return false;
        }
    }


    /***
     * @param $number
     * @param $type  0注册  1找回密码 2绑定手机 3绑定邮箱
     * @return int
     */
    public static function checkSendCode($number,$type){
        $reg ='/^1[3|4|5|6|7|9|8][0-9]\d{8}$/';
        if(preg_match($reg,$number)) {
            $result=Yii::$app->db->createCommand("select * from syscode WHERE number='".$number."' AND type=".$type." AND is_use=0 AND send_type=0 order by oid desc")->queryOne();
        }else{
            $result=Yii::$app->db->createCommand("select * from syscode WHERE number='".$number."' AND type=".$type." AND is_use=0 AND send_type=1 order by oid desc")->queryOne();
        }
        if(!empty($result)){
            $s=time()-$result['created_time'];
            if($s<60){
                return 60-$s;
            }
            return 0;
        }else{
            return 0;
        }
    }

    public static function getCode($number,$code,$type){
        $reg ='/^1[3|4|5|6|7|9|8][0-9]\d{8}$/';
        if(preg_match($reg,$number)) {
            return Syscode::find()->where("number='$number' AND type=$type AND code='$code' AND send_type=0")->one();
        }else{
            return Syscode::find()->where("number='$number' AND type=$type AND code='$code' AND send_type=1")->one();
        }
    }
}
