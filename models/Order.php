<?php

namespace app\models;

use app\helpers\Helper;
use Exception;
use Yii;

/**
 * This is the model class for table "order".
 *
 * @property string $oid
 * @property string $user_id
 * @property string $order_sn
 * @property integer $order_status
 * @property string $goods_amount
 * @property string $express_amount
 * @property string $discount_amount
 * @property string $order_amount
 * @property integer $payment_status
 * @property integer $pay_type
 * @property string $pay_time
 * @property string $pay_number
 * @property string $order_message
 * @property string $express_id
 * @property string $address_id
 * @property integer $express_status
 * @property string $express_time
 * @property string $emaill
 * @property string $province_name
 * @property string $district_name
 * @property string $city_name
 * @property string $mobile
 * @property string $tel
 * @property string $address
 * @property string $express_sn
 * @property string $createdtime
 * @property string $updatedby
 * @property string $address_name
 * @property integer $paytype_code
 * @property integer $close_order_time
 * @property integer $close_order_desc
 * @property string $stocking_time
 * @property string $stocking_desc
 * @property string $sign_time
 * @property string $auto_sign_order_day
 *  @property string $comment_count
 *  @property string $goods_count
 *
 * close_order_desc
 */
class Order extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'order';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'order_status','goods_count','comment_count', 'payment_status', 'pay_type','stocking','sign_time','close_order_time', 'pay_time', 'express_id', 'address_id', 'express_status', 'express_time', 'createdtime'], 'integer'],
            [['goods_amount', 'express_amount', 'discount_amount', 'order_amount'], 'number'],
            [['order_sn', 'province_name', 'district_name', 'city_name', 'mobile', 'tel'], 'string', 'max' => 50],
            [['pay_number'], 'string', 'max' => 30],
            [['order_message','paytype_code', 'emaill','auto_sign_order_day', 'address','close_order_desc','stocking_desc','express_sn','address_name'], 'string', 'max' => 200],
            [['updatedby'], 'string', 'max' => 20],
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
            'order_sn' => 'Order Sn',
            'order_status' => 'Order Status',
            'goods_amount' => 'Goods Amount',
            'express_amount' => 'Express Amount',
            'discount_amount' => 'Discount Amount',
            'order_amount' => 'Order Amount',
            'payment_status' => 'Payment Status',
            'pay_type' => 'Pay Type',
            'pay_time' => 'Pay Time',
            'pay_number' => 'Pay Number',
            'order_message' => 'Order Message',
            'express_id' => 'Express ID',
            'address_id' => 'Address ID',
            'express_status' => 'Express Status',
            'express_time' => 'Express Time',
            'emaill' => 'Emaill',
            'province_name' => 'Province Name',
            'district_name' => 'District Name',
            'city_name' => 'City Name',
            'mobile' => 'Mobile',
            'tel' => 'Tel',
            'address' => 'Address',
            'express_sn' => 'Express Sn',
            'createdtime' => 'Createdtime',
            'updatedby' => 'Updatedby',
        ];
    }

    public static function newOrderSn(){
        $sn="";
        do {
           $sn= date('Ymd') . str_pad(mt_rand(1, 9999999999),10, '0', STR_PAD_LEFT);
           $count=Yii::$app->db->createCommand("select count(*) from `order`  WHERE order_sn='".$sn."'")->queryScalar();
        } while ($count>0);
        return $sn;
    }

    public static function getOrderGoods($order_id,$is_name=false,$is_comment=false,$is_result_comment=false){

        if($is_comment<>false || ($is_comment===0 || $is_comment===1)  ){
            $result=Yii::$app->db->createCommand("SELECT og.*,g.name as goods_name,g.goods_sn FROM order_goods as og  INNER JOIN goods as g ON g.oid=og.goods_id WHERE og.is_comment=$is_comment AND og.order_id=$order_id")->queryAll();
        }else{
            $result=Yii::$app->db->createCommand("SELECT og.*,g.name as goods_name,g.goods_sn FROM order_goods as og  INNER JOIN goods as g ON g.oid=og.goods_id WHERE og.order_id=$order_id")->queryAll();
        }

        $listGoodsName="";
        foreach($result as $key=>$val){
            if(!empty($val['goods_sku_id']) && $val['goods_sku_id']>0){
                if($is_name){
                    $sku=Yii::$app->db->createCommand("SELECT goods_attr FROM goods_sku WHERE goods_id=".$val['goods_id']." AND oid=".$val['goods_sku_id'])->queryScalar();
                    $sku=str_replace("|",",",$sku);
                    $listAttr=Yii::$app->db->createCommand("SELECT Group_concat(attr_value SEPARATOR ' ') FROM goods_attr WHERE oid in(".$sku.")  order by attr_id asc")->queryScalar();
                    if(empty($listGoodsName)){
                        $listGoodsName=$val['goods_name']." ".$listAttr;
                    }else{
                        $listGoodsName.=" / ".$val['goods_name']." ".$listAttr;
                    }
                }else{
                    $sku=Yii::$app->db->createCommand("SELECT product_sn,product_number FROM goods_sku WHERE goods_id=".$val['goods_id']." AND oid=".$val['goods_sku_id'])->queryOne();
                    $val['goods_sn']=$sku['product_sn'];
                    $sku=Yii::$app->db->createCommand("SELECT goods_attr FROM goods_sku WHERE goods_id=".$val['goods_id']." AND oid=".$val['goods_sku_id'])->queryScalar();
                    $sku=str_replace("|",",",$sku);
                    $listAttr=Yii::$app->db->createCommand("SELECT attr_id,attr_name,attr_value,attr_icon FROM goods_attr WHERE oid in(".$sku.")  order by attr_id asc")->queryAll();
                    $val['list_attr']=$listAttr;
                }
            }else{
                if($is_name){
                    if(empty($listGoodsName)){
                        $listGoodsName=$val['goods_name'];
                    }else{
                        $listGoodsName.=" / ".$val['goods_name'];
                    }
                }else{
                    $val['list_attr']=[];
                }
            }
            if($is_result_comment){
                $val['comment']=Yii::$app->db->createCommand("SELECT content,score FROM comment WHERE goods_id=$val[goods_id] AND sku_id=$val[goods_sku_id]")->queryOne();
            }
            $result[$key]=$val;
        }
        return $is_name?$listGoodsName:$result;
    }

    /***
     * 获取支付方式
     * @param bool $k
     * @return array|mixed|string
     */
    public static function getPayment($k=false){
        $key="payment";
        $result=Helper::getCache($key);
        if($result==false){
            $result=Yii::$app->db->createCommand("SELECT code,name,pics FROM payment WHERE type=0 AND is_use=1 order by sort asc")->queryAll();
            if(!empty($result)){
                Helper::setCache($key,$result);
            }
        }
        if(!empty($k)){
            foreach ($result as $val){
                if($val['code']==$k){
                    $cache_pay_key="pay_".$key;
                    $filedList=Helper::getCache($cache_pay_key);
                    if($filedList==false){
                        $filedList=Yii::$app->db->createCommand("SELECT field,field_value FROM payment_field WHERE payment_code='$k'")->queryAll();
                        Helper::setCache($cache_pay_key,$filedList);
                    }
                    foreach($filedList as $field){
                        $val[$field['field']]=$field['field_value'];
                    }
                    return $val;
                    break;
                }
            }
            return "";
        }else{
            return $result;
        }
    }

    /****
     * 支付成功处理订单信息
     */
    public function handle(){
        $connection=Yii::$app->db;
        $transaction = $connection->beginTransaction();
        $uid=$this->user_id;
        $this->pay_time=time();
        try {
            $time=time();
            $order_id=$this->oid;
            $payname=Order::getPayment($this->paytype_code);
            $payname=$payname['name'];
            $log="订单完成支付，支付类型：".$payname." 支付流水号：".$this->pay_number;
            //修改订单为已支付订单
            $sql="UPDATE  `order` set order_status=1,payment_status=1,pay_time=".$this->pay_time.",paytype_code='".$this->paytype_code."',pay_number='".$this->pay_number."' WHERE oid=".$this->oid;
            //插入订单日志
            $logsql="INSERT INTO order_log(order_id,description,createdtime) VALUES ($order_id,\"$log\",$time)";


            $order_id=$this->oid;

            //修改商品库存信息
            $updateGoods1="
                update goods as g INNER JOIN order_goods as og on og.goods_id=g.oid
                SET g.buy_goods_number=g.buy_goods_number+og.number,
                g.goods_number=g.goods_number-og.number
                WHERE og.order_id=$order_id
            ";
            $updateSkuGoods="
                update goods_sku as g INNER JOIN order_goods as og on og.goods_sku_id=g.oid
                SET g.product_buy_number=g.product_buy_number+og.number,
                g.product_number=g.product_number-og.number
                WHERE og.order_id=$order_id AND og.goods_sku_id>0
            ";
            $connection->createCommand($sql)->execute();
            $connection->createCommand($logsql)->execute();
         //   $connection->createCommand($userSql)->execute();
            $connection->createCommand($updateGoods1)->execute();
            $connection->createCommand($updateSkuGoods)->execute();
            $transaction->commit();
        } catch (Exception $e) {
            return false;
        }
        return true;
    }

    public static function handleAttr($attr_value){
        $arr_value=explode("/",$attr_value);
         return $arr_value;
    }
    /****
     * 处理订单状态
     */
    public static function handleOrderStatus($status,$pay_status,$express_status){
        if($status==0 && $pay_status==0 && $express_status==0){//未支付   待支付  未发货
            return "未支付";
        }else if($status==1 && $pay_status==1 && $express_status==0){
            return "已支付，待发货";
        }else if($status==1 && $pay_status==1 && $express_status==1){
            return "已支付，备货中";
        }else if($status==1 && $pay_status==1 && $express_status==2){
            return "已支付，已发货";
        }else if($status==1 && $pay_status==1 && $express_status==3){
            return "已支付，已签收";
        }else if($status==2 && $pay_status==0){
            return "支付失败";
        }else{
            return "已取消";
        }
    }

    public static function getOrderCount($type,$user_id){
        $count=0;
        if($type=="list"){
            $sql=vsprintf("select count(*) from `order` WHERE user_id in (%s)  AND is_delete=0",[$user_id]);
        }else{
            $sql=vsprintf("select count(*) from `order` WHERE user_id in (%s)  AND is_delete=0",[$user_id]);
            $sql.=Order::getOrderWhere($type);
        }
        $count=Yii::$app->db->createCommand($sql)->queryScalar();
        return $count;
    }
    public static function getOrderWhere($type){
        if($type=="list"){
            return " AND 1=1";
        }else if($type=="topay"){
            return " AND (order_status=0 or order_status=2) AND payment_status=0 AND express_status=0";
        }else if($type=="confirm"){
            return " AND order_status=1 AND payment_status=1 AND (express_status=1 or express_status=0 or express_status=2)";
        }else if($type=="complete"){
            return " AND order_status=1 AND payment_status=1 AND (express_status=3)";
        }else{
            return " AND order_status=3";
        }
    }

    /***
     * 系统取消订单
     * @param null $log
     * @return bool
     */
    public function cancel($log=null,$desc=null){
        if($this->order_status==0 && $this->payment_status==0){
            $connection=Yii::$app->db;
            $transaction = $connection->beginTransaction();
            $uid=$this->user_id;
            try {
                $time=time();
                $order_id=$this->oid;
                if(empty($log)){
                    $log="订单24小时未支付，系统自动取消订单";
                }
                if(empty($desc)){
                    $desc="订单24小时未支付";
                }
                //修改订单为已支付订单
                $sql="UPDATE  `order` set order_status=3,close_order_time=".$time.",close_order_desc='$desc' WHERE oid=".$order_id;
                //插入订单日志
                $logsql="INSERT INTO order_log(order_id,description,createdtime) VALUES ($order_id,\"$log\",$time)";
                $connection->createCommand($sql)->execute();
                $connection->createCommand($logsql)->execute();
                $transaction->commit();
            } catch (Exception $e) {
                return false;
            }
            return true;
        }
        return true;
    }

    public static function getPayName($pay_code){
        $payment=Order::getPayment($pay_code);
        return $payment['name'];
    }

    /***
     * 签收订单
     */
    public function sign($log=null,$is_handle=false){

        if($this->express_status==2 && $this->order_status==1 && $this->payment_status==1){//已发货 / 已支付 /已付款
            $day=$this->auto_sign_order_day?$this->auto_sign_order_day>0:Yii::$app->params['auto_sign_order_day'];
            $time=time();
            if(($time>=($this->express_time+84600*$day) || $is_handle)){
                $connection=Yii::$app->db;
                $transaction = $connection->beginTransaction();
                $uid=$this->user_id;
                try {
                    $time=time();
                    $order_id=$this->oid;
                    if(empty($log)){
                        $log="订单已经签收";
                    }
                    //修改订单为已支付订单
                    $sql="UPDATE  `order` set express_status=3,sign_time=".$time." WHERE oid=".$order_id;
                    //插入订单日志
                    $logsql="INSERT INTO order_log(order_id,description,createdtime) VALUES ($order_id,\"$log\",$time)";
                    $user=$connection->createCommand("SELECT *  FROM user WHERE oid=$uid")->queryOne();
                    //修改用户积分
                    $userSql="UPDATE user set integral=integral+".$this->order_amount." WHERE oid=".$uid;
                    UserIntegralLog::addItem($user,$this->order_amount,0,"购买商品获得积分，订单号：".$this->order_sn,$connection);
                    $connection->createCommand($sql)->execute();
                    $connection->createCommand($logsql)->execute();
                    $connection->createCommand($userSql)->execute();
                    $transaction->commit();
                } catch (Exception $e) {
                    return false;
                }
                return true;
            }
        }else{
            return true;
        }
    }
}
