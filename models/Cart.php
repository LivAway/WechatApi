<?php

namespace app\models;

use app\helpers\Helper;
use Yii;

/**
 * This is the model class for table "cart".
 *
 * @property string $oid
 * @property string $user_id
 * @property string $goods_id
 * @property integer $number
 * @property string $goods_sku_id
 * @property string $attr_ids
 * @property string $attr_name
 * @property string $attr_value
 * @property string $price
 * @property string $phone_price
 * @property string $market_price
 * @property string $createdtime
 * @property string $updatedtime
 * @property string $goods_pic
 */
class Cart extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cart';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'goods_id', 'number', 'goods_sku_id', 'createdtime','updatedtime'], 'integer'],
            [['price', 'phone_price', 'market_price'], 'number'],
            [['attr_ids', 'attr_name', 'attr_value','goods_pic'], 'string', 'max' => 200],
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
            'goods_id' => 'Goods ID',
            'number' => 'Number',
            'goods_sku_id' => 'Goods Sku ID',
            'attr_ids' => 'Attr Ids',
            'attr_name' => 'Attr Name',
            'attr_value' => 'Attr Value',
            'price' => 'Price',
            'phone_price' => 'Phone Price',
            'market_price' => 'Market Price',
            'createdtime' => 'Createdtime',
        ];
    }

    public static function chekCart($param){
        $uid=Yii::$app->user->id;
        $sku=json_decode($param['sku'],true);
        $attr_ids="";
        $attr_name="";
        $attr_value="";
        foreach ($sku as $key=>$val){
            if($key==0){
                $attr_ids.=$val['attr_key'];
                $attr_name.=$val['attr_name'];
                $attr_value.=$val['attr_value'];
            }else{
                $attr_ids.=",".$val['attr_key'];
                $attr_name.=",".$val['attr_name'];
                $attr_value.=",".$val['attr_value'];
            }
        }
        $model=Cart::find()->where([
            'user_id'=>$uid,
            'goods_id'=>$param['goods_id'],
            'goods_sku_id'=>$param['sku_id'],
            'attr_ids'=>$attr_ids,
            'attr_name'=>$attr_name,
            'attr_value'=>$attr_value,
        ])->one();
        if(!empty($model)){
            $model->number=$param['number'];
            $model->updatedtime=time();
            $model->save();
            exit(json_encode(['code'=>400]));
        }else{
            return true;
        }
    }

    public static function addItem($goods,$param,$market_price){
        $sku=json_decode($param['sku'],true);

        $attr_ids="";
        $attr_name="";
        $attr_value="";
        $attr_pics_id=0;
        foreach ($sku as $key=>$val){
            if($key==0){
                $attr_ids.=$val['attr_key'];
                $attr_name.=$val['attr_name'];
                $attr_value.=$val['attr_value'];
            }else{
                $attr_ids.=",".$val['attr_key'];
                $attr_name.=",".$val['attr_name'];
                $attr_value.=",".$val['attr_value'];
            }
            if($val['is_upload']==1 && $attr_pics_id==0){
                $attr_pics_id=$val['attr_value'];
            }
        }

        if($attr_pics_id>0){
            $pic=Yii::$app->db->createCommand("select pic from goods_album where goods_id=".$param['goods_id']." AND product_id=$attr_pics_id order by sort asc limit 0,1")->queryScalar();
            if(!empty($pic)) {
                $param['goods_pic'] = $pic;
            }
        }

        $model=new Cart();
        $model->goods_id=$param['goods_id'];
        $model->goods_sku_id=$param['sku_id'];
        $model->number=$param['number'];
        $model->attr_ids=$attr_ids;
        $model->attr_name=$attr_name;
        $model->attr_value=$attr_value;
        $model->price=$goods->price;
        $model->market_price=$market_price;
        $model->phone_price=$goods->phone_price;
        $model->user_id=Yii::$app->user->id;
        $model->goods_pic=$param['goods_pic'];
        $model->createdtime=time();
        return $model->save();
    }

    public static function getNumber(){
        if(Yii::$app->user->isGuest){
            return "";
        }else{
            $count=Yii::$app->db->createCommand("select count(*) from cart WHERE user_id=".Yii::$app->user->id)->queryScalar();
            return $count>0?"<span>$count</span>":"";
        }
    }

    /***
     * 获取当条地址信息
     * @param $aid
     */
    public static function getAddress($aid){
        if(empty($aid)){
            $aid=0;
        }
        $sql=vsprintf("select * from user_address WHERE oid=%s",[$aid]);
        return Yii::$app->db->createCommand($sql)->queryOne();
    }


    public static function getShipping($k=null){
        $key="shipping";
        $result=Helper::getCache($key);
        if($result==false){
            $result=Yii::$app->db->createCommand("SELECT * FROM shipping WHERE isvalid=1 order by sort asc")->queryAll();
            if(!empty($result)){
                Helper::setCache($key,$result);
            }
        }
        if(!empty($k)){
            foreach ($result as $val){
                if($val['oid']==$k){
                    return $val;
                    break;
                }
            }
        }else{
            return $result;
        }

    }


    public static function getPaytype($k=null){
        $key="paytype";
        $result=Helper::getCache($key);
        if($result==false){
            $result=Yii::$app->db->createCommand("SELECT * FROM paytype WHERE isvalid=1 order by sort asc")->queryAll();
            if(!empty($result)){
                Helper::setCache($key,$result);
            }
        }
        if(!empty($k)){
            foreach ($result as $val){
                if($val['oid']==$k){
                    return $val;
                    break;
                }
            }
            return "";
        }else{
            return $result;
        }
        return $result;
    }
    public static function getRise($user){
        $uid=$user->getId();
        $key="user_".$uid;
        $result=Helper::getCache($key);
        if($result==false){
            $result=Yii::$app->db->createCommand("SELECT * FROM invoice WHERE user_id=$uid")->queryOne();
            if(!empty($result)){
                Helper::setCache($key,$result);
            }
        }
        return $result;
    }

    public static function getCartGoods($isAll,$user_id){
        if($isAll){
            $where=" AND 1";
            $collect=[];
        }else{
            $where=" AND c.is_selected=1";
            $collect=Yii::$app->db->createCommand("SELECT GROUP_CONCAT(goods_id) FROM collect WHERE user_id=".$user_id)->queryScalar();
            $collect=explode(",",$collect);
        }
        $result=Yii::$app->db->createCommand("SELECT c.*,g.goods_number,g.name as goods_name,g.goods_sn FROM cart as c 
          INNER JOIN goods as g ON g.oid=c.goods_id
         WHERE user_id=".$user_id.$where)->queryAll();
        foreach ($result as $key=>$val){
            if(!empty($val['goods_sku_id']) && $val['goods_sku_id']>0){
                $sku=Yii::$app->db->createCommand("SELECT product_sn,product_number FROM goods_sku WHERE goods_id=".$val['goods_id']." AND oid=".$val['goods_sku_id'])->queryOne();
                $val['goods_number']=$sku['product_number'];
                $val['goods_sn']=$sku['product_sn'];
                $listAttr=Yii::$app->db->createCommand("SELECT attr_id,attr_name,attr_value,attr_icon FROM goods_attr WHERE attr_id in(".$val['attr_ids'].") AND oid in(".$val['attr_value'].") order by attr_id asc")->queryAll();
                $val['list_attr']=$listAttr;
            }else{
                $val['list_attr']=[];
            }
            $val['is_collect']=in_array($val['goods_id'],$collect);
            $result[$key]=$val;
        }
        return $result;
    }

    public static function updateCart($user_id){
        $sql="update  cart as c INNER JOIN goods as g ON g.oid=c.goods_id 
set c.number=g.goods_number,c.is_selected=0
 WHERE c.user_id=$user_id AND g.goods_number<c.number and goods_sku_id=0;";
        $sql1="update  cart as c INNER JOIN goods_sku as g ON g.oid=c.goods_sku_id 
set c.number=g.product_number,c.is_selected=0
 WHERE c.user_id=$user_id AND g.product_number<c.number and c.goods_sku_id>0";
        Yii::$app->db->createCommand($sql)->execute();
        Yii::$app->db->createCommand($sql1)->execute();
    }

    /***
     * 计算价格
     * @param $address 地址信息
     * @param $goods_price 商品总价格
     * @param $user 用户
     */
    public static function calcPrice($address,$goods_price,$user){
        $freight=0.00;
        $discountPrice=0.00;//优惠金额
        $orderPrice=$goods_price+$freight-$discountPrice;
        return [
            'goodsPrice'=>$goods_price,
            'freight'=>$freight,
            'orderPrice'=>$orderPrice,
            'discountPrice'=>$discountPrice
        ];
    }

    public static function getGoodsPrice($user_id){
        return Yii::$app->db->createCommand("SELECT if(sum(number*price)>0,sum(number*price),0.00) as price,count(*) as counts FROM cart WHERE user_id=$user_id AND is_selected=1")->queryOne();
    }



    public static function getUserAddress(){
        $user=Yii::$app->user->identity;
        $key="user_address_".$user->getId();
        $result=Helper::getCache($key);
        if($result==false){
            $result=Yii::$app->db->createCommand("SELECT * FROM user_address WHERE user_id=".$user->getId()." order by 2 desc")->queryAll();
            if(!empty($result)){
                Helper::setCache($key,$result);
            }
        }
        $user_address=[];
        $default_address=[];
        if(!empty($result)){
            foreach ($result as $val){
                if($val['oid']==$user->address_id){
                    $val['is_default']=true;
                    $default_address[]=$val;
                }else{
                    $val['is_default']=false;
                    $user_address[]=$val;
                }
            }
        }
        return array_merge($default_address,$user_address);
    }
}
