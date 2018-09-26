<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "goods_sku".
 *
 * @property string $oid
 * @property string $goods_id
 * @property string $goods_attr
 * @property string $product_sn
 * @property string $product_number
 * @property string $price
 * @property string $phone_price
 * @property string $goods_type_id
 * @property integer $product_buy_number
 */
class GoodsSku extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'goods_sku';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['goods_id', 'product_number', 'goods_type_id', 'product_buy_number'], 'integer'],
            [['price', 'phone_price'], 'number'],
            [['goods_attr'], 'string', 'max' => 50],
            [['product_sn'], 'string', 'max' => 60],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'oid' => 'Oid',
            'goods_id' => 'Goods ID',
            'goods_attr' => 'Goods Attr',
            'product_sn' => 'Product Sn',
            'product_number' => 'Product Number',
            'price' => 'Price',
            'phone_price' => 'Mobile Price',
            'goods_type_id' => 'Goods Type ID',
            'product_buy_number' => 'Product Buy Number',
        ];
    }
}
