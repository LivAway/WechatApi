<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "user_integral_log".
 *
 * @property string $oid
 * @property string $user_id
 * @property integer $type
 * @property integer $integral
 * @property integer $total_integral
 * @property string $desctiption
 * @property string $createdtime
 */
class UserIntegralLog extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'user_integral_log';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'type', 'integral', 'total_integral', 'createdtime'], 'integer'],
            [['desctiption'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'oid' => 'Oid',
            'user_id' => 'User ID',
            'type' => 'Type',
            'integral' => 'Integral',
            'total_integral' => 'Total Integral',
            'desctiption' => 'Desctiption',
            'createdtime' => 'Createdtime',
        ];
    }

    /***
     * 插入积分日志
     * @param $user_id 用户id
     * @param $user   用户
     * @param $oldjifen 原来积分
     * @param $type 类型 0 获取积分1 消费积分
     * @param $msg 说明
     * @param null $connection sql对象
     */
    public static function addItem($user,$jifen,$type,$msg,$user_id,$connection=null){
        if(empty($connection)){
            $connection=Yii::$app->db;
        }
        $time=time();
        $tatol=$jifen+$user['integral'];
        $user_id=$user['oid'];
        $logsql="INSERT INTO user_integral_log(user_id,type,integral,total_integral,desctiption,createdtime) VALUES ($user_id,$type,$jifen,$tatol,\"$msg\",$time)";
        $connection->createCommand($logsql)->execute();
    }
}
