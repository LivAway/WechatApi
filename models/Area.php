<?php
namespace app\models;

use app\helpers\Helper;
use Yii;

/**
 * This is the model class for table "area".
 *
 * @property string $oid
 * @property string $name
 * @property string $parent_id
 *生成时间 2016-10-16 20:44:24 */
class Area extends \yii\db\ActiveRecord
{
    //列表常量

    //临时属性

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'area';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['parent_id'], 'integer'],
            [['name'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'oid' => 'Oid',
            'name' => '名称',
            'parent_id' => '父级地区',
        ];
    }

    /**
     * 保存之前执行
     */

    public function beforeSave($insert)
    {
        parent::beforeSave($insert);
        if ($this->isNewRecord) {
        } else {
        }
        return true;
    }


    /**
     * 验证之前执行
     */
    public function beforeValidate()
    {
        return parent::beforeValidate();
    }

    /*****
     * @param int $parent_id 父類id
     */
    public static function getListArea($parent_id=0){
        $key="area_list_".$parent_id;
        $result=Helper::getCache($key);
        if($result==false){
            $result=Yii::$app->db->createCommand("SELECT oid,name FROM area WHERE parent_id=$parent_id")->queryAll();
            Helper::setCache($key,$result);
        }
        $arr=[];
        if(!empty($result)){
            foreach($result as $val ){
                $arr[$val['oid']]=$val['name'];
            }
        }
        return $arr;
    }
}
