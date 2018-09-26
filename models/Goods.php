<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "goods".
 *
 * @property string $oid
 * @property string $goods_sn
 * @property string $name
 * @property string $category_id
 * @property string $goods_type_id
 * @property string $brand_id
 * @property string $subtitle
 * @property string $market_price
 * @property string $price
 * @property string $phone_price
 * @property string $goods_pic
 * @property string $goods_desc
 * @property string $goods_spe
 * @property integer $goods_number
 * @property integer $is_sale
 * @property string $keywords
 * @property integer $is_home
 * @property string $path_name
 * @property string $path_ids
 * @property string $place
 * @property string $createdtime
 * @property string $createdby
 * @property string $updatedtime
 * @property string $updatedby
 * @property integer $buy_goods_number
 * @property integer $sort
 * @property string $comment_count
 */
class Goods extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'goods';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['category_id', 'goods_type_id', 'brand_id','comment_count', 'goods_number', 'is_sale', 'is_home', 'createdtime', 'updatedtime', 'buy_goods_number', 'sort'], 'integer'],
            [['market_price', 'price', 'phone_price'], 'number'],
            [['goods_desc'], 'string'],
            [['goods_sn', 'goods_pic'], 'string', 'max' => 100],
            [['name', 'subtitle', 'keywords', 'path_name', 'path_ids'], 'string', 'max' => 200],
            [['goods_spe'], 'string', 'max' => 500],
            [['place'], 'string', 'max' => 50],
            [['createdby', 'updatedby'], 'string', 'max' => 20],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'oid' => 'Oid',
            'goods_sn' => 'Goods Sn',
            'name' => 'Name',
            'category_id' => 'Category ID',
            'goods_type_id' => 'Goods Type ID',
            'brand_id' => 'Brand ID',
            'subtitle' => 'Subtitle',
            'market_price' => 'Market Price',
            'price' => 'Price',
            'phone_price' => 'Phone Price',
            'goods_pic' => 'Goods Pic',
            'goods_desc' => 'Goods Desc',
            'goods_spe' => 'Goods Spe',
            'goods_number' => 'Goods Number',
            'is_sale' => 'Is Sale',
            'keywords' => 'Keywords',
            'is_home' => 'Is Home',
            'path_name' => 'Path Name',
            'path_ids' => 'Path Ids',
            'place' => 'Place',
            'createdtime' => 'Createdtime',
            'createdby' => 'Createdby',
            'updatedtime' => 'Updatedtime',
            'updatedby' => 'Updatedby',
            'buy_goods_number' => 'Buy Goods Number',
            'sort' => 'Sort',
        ];
    }
    public static function getRecomment($limit=6,$is_filter=false){
        if($is_filter){
            $pic_url=Yii::$app->params['casesRoot'];
            $pic_size=Yii::$app->params['casesSize400'];
            $list=Yii::$app->db->createCommand("SELECT oid,goods_sn,name,subtitle,CONCAT('$pic_url',goods_pic,'$pic_size') as goods_pic,price,phone_price,goods_number,collect_count,comment_count,buy_goods_number FROM goods WHERE is_sale=1 AND is_home=1 ORDER BY sort asc LIMIT 0,$limit")->queryAll();
        }else{
            $list=Yii::$app->db->createCommand("SELECT * FROM goods WHERE is_sale=1 AND is_home=1 ORDER BY sort asc LIMIT 0,$limit")->queryAll();
        }
        return $list;
    }
}
