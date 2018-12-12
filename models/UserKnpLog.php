<?php
/**
 * Created by PhpStorm.
 * User: darren
 * Date: 2018-12-12
 * Time: 23:24
 */

namespace app\models;
use yii\db\ActiveRecord;
class UserKnpLog extends ActiveRecord
{
    public $updated_at;
    public $duetime;
    public $token;

    public static function tableName()
    {
        //对应的表名
        return '{{%user_knp_log}}';
    }




}