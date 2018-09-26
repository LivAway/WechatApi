<?php

namespace app\models;
use app\helpers\Helper;
use Exception;
use Yii;
use yii\db\ActiveRecord;
use yii\web\IdentityInterface;
class User extends ActiveRecord implements IdentityInterface
{
    public $updated_at;
    public $duetime;
    public $token;

    public static function tableName()
    {
        //对应的表名
        return '{{%user}}';
    }

    public static function findIdentity($id)
    {
        //自动登陆时会调用
        $temp = parent::find()->where(['oid'=>$id])->one();
        return isset($temp)?new static($temp):null;
    }
	
	 /**
     * Finds out if password reset token is valid
     *
     * @param string $token password reset token
     * @return bool
     */
    public static function isPasswordResetTokenValid($token)
    {
        if (empty($token)) {
            return false;
        }
        $timestamp = (int) substr($token, strrpos($token, '_') + 1);
        $expire = Yii::$app->params['token_expire'];
        return $timestamp + $expire >= time();
    }

    public function getId()
    {
        return $this->oid;
    }

    public function validatePassword($password)
    {
        return $this->password === self::getSalt($password);
    }
    /**
     * 密码加密处理
     * @param string $password 用户登录的密码
     * @return string $password
     */
    public static function getSalt($password){
        return md5($password);
    }

    public function getAuthKey() {}

    public function validateAuthKey($authKey) {}

	
	public static function findIdentityByAccessToken($token, $type = null)
    {

        if(empty($token)){
            return false;
        }else{
            $model=AuthToken::findOne(['token'=>$token]);
			
            if(empty($model)){
                return false;
            }
            if($model->duetime<time()){
                return false;
            }
				
            if($model->is_update==1){
                $model->duetime=$model->expires_in+time();
                $model->save();
		
            }
        }

        return static::findOne(['oid' => $model->user_id] );
    }

    /**
     * 获取用户登录信息
     * @param  string $username 用户名
     * @return object
     * **/
    public static function findByUserName($username){
	
        $user=User::find()->where ("username=:ue",["ue"=>$username])->one();

        if(empty($user)){
            $user=User::find()->where ("mobile=:ue",["ue"=>$username])->one();
            if(empty($user)){
                $user=User::find()->where ("email=:ue",["ue"=>$username])->one();
                if(empty($user)){
                    $user=User::find()->where ("openid=:ue",["ue"=>$username])->one();
                }
            }
        }
        return $user;
    }
    public function generateToken()
    {
        $this->token = Yii::$app->security->generateRandomString();

    }

    /**
     * 获取用户信息
     * @param  string $username 手机号或者邮箱
     * @return object
     * **/
    public static function findByUser($username){
        $user=self::find()->where (["mobile"=>$username])->one();
        if(empty($user)){
            $user=self::find()->where (["email"=>$username])->one();
        }
        return $user;
    }

    /**
     * 登录后执行
     */
    public function afterExecutive(){
        if(!empty($this->last_login_time))
            $this->last_login_time=$this->login_time;
        else
            $this->login_time=time();
        $this->login_count+=1;
        $this->save();
    }

    public static function handleUser($mobile){

        return   substr_replace($mobile,'*****',3,5);
    }

    public static  function hideStar($str) { //用户名、邮箱、手机账号中间字符串以*隐藏
        if(empty($str)){
            return "";
        }
        if (strpos($str, '@')) {
            $email_array = explode("@", $str);
            $prevfix = (strlen($email_array[0]) < 4) ? "" : substr($str, 0, 3); //邮箱前缀
            $count = 0;
            $str = preg_replace('/([\d\w+_-]{0,100})@/', '***@', $str, -1, $count);
            $rs = $prevfix . $str;
        } else {
            $pattern = '/(1[3458]{1}[0-9])[0-9]{4}([0-9]{4})/i';
            if (preg_match($pattern, $str)) {
                $rs = preg_replace($pattern, '$1****$2', $str); // substr_replace($name,'****',3,4);
            } else {
                $rs = substr($str, 0, 3) . "***" . substr($str, -1);
            }
        }
        return $rs;
    }

    public static function checkMobile($mobile,$user_id){
        $reg ='/^1[3|4|5|6|7|9|8][0-9]\d{8}$/';
        $regEmail ='/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/';
        if(strlen($mobile)<11){
            return "手机号不能为空，且长度必须为11位长度";
        }
        if(!preg_match($reg,$mobile)) {
            return "手机号输入有误";
        }else{
            $model=User::find()->where(['mobile'=>$mobile])->andWhere("oid<>".$user_id)->one();
            if(empty($model)){
                $model=User::find()->where(['username'=>$mobile])->andWhere("oid<>".$user_id)->one();
            }
            if(!empty($model)){
                return "手机号，已被使用";
            }
            return true;
        }
    }
    public static function checkEmail($email){
        $regEmail ='/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/';
        if(empty($email)){
            return "邮箱不能为空";
        }
        if(!preg_match($regEmail,$email)) {
            return "邮箱格式输入有误";
        }else{
            $model=User::find()->where(['email'=>$email])->one();
            if(empty($model)){
                $model=User::find()->where(['username'=>$email])->one();
            }
            if(!empty($model)){
                return "邮箱，已被使用";
            }
            return true;
        }
    }

    public static function checkOpenid($openid){//判断openid 是否存在
        $count= Yii::$app->db->createCommand("SELECT count(*) FROM `user` WHERE `openid`='".$openid."'")->queryScalar();
        return $count>0;
    }

    public static function handleOtherLogin($user,$source){//处理第三方登录
        $connection=Yii::$app->db;
        $transaction = $connection->beginTransaction();
        $reg_source=3;//注册设备[search][list]0:PC|1:Android|2:IOS|3:Mobile
        try {
            $time=time();
            $username="weixin_".substr($user['openid'],0,8);
			$knp=10;
            $sqll="INSERT INTO `user`(username,openid,nickname,headpic,isvalid,reg_time,reg_source,source,total_KNP,overplus_KNP) VALUES (\"$username\",\"$user[openid]\",\"$user[nickname]\",\"$user[headimgurl]\",1,$time,$reg_source,\"$source\",$knp,$knp)";
			$connection->createCommand($sqll)->execute();
            $uid=Yii::$app->db->getLastInsertID();
			self::inserKNPLOG($knp,1,0,"首次注册获得:".$knp."KNP",$uid,$connection);
            $transaction->commit();
            return true;
        } catch (Exception $e) {
            return false;
        }
    }

    public static function Login($info){

        $user = User::findByUserName($info->openid);
        //$user = User::findByUserName($info);
        if(!empty($user)){
            Yii::$app->user->login($user,true? 3600 * 24 * 30 : 0);
        }
        return true;
    }
    //获取微信公众号 签名信息
    public static function getWeixinSign(){
        $wx_appid=Yii::$app->params['wx_appid'];
        $wx_appSecret=Yii::$app->params['wx_appSecret'];
        $result_data=Helper::getCache($wx_appid);
		
        if($result_data==false || $result_data['expires_time']<=time()){
            $result_data=Yii::$app->db->createCommand("SELECT * FROM weixin_auth WHERE wx_appid='$wx_appid'")->queryOne();


            if(empty($result_data) || $result_data['expires_time']<=time()){
                $url="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$wx_appid&secret=$wx_appSecret";//获取微信token
                $result =json_decode(file_get_contents($url));
                if(!empty($result->access_token)){
                    $time=time();
                    $token=$result->access_token;
                    $expires_in=$result->expires_in;
                    $expires_in_time=$time+$expires_in;
                    $url="https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=$token&type=jsapi";//获取微信token
                    $result =json_decode(file_get_contents($url));
                    if($result->errmsg=="ok"){
                        $request_arr=[
                            'jsapi_ticket'=>$result->ticket,
                            'noncestr'=>md5("abc"),
                            'timestamp'=>$time,
                            'url'=>Yii::$app->request->getHostInfo(),
                        ];
                        $string="jsapi_ticket=$request_arr[jsapi_ticket]&noncestr=$request_arr[noncestr]&timestamp=$request_arr[timestamp]&url=$request_arr[url]";
                        $jsapi_ticket=$result->ticket;
                        $signature=sha1($string);//生成签名
                        if(empty($result_data)){
                            Yii::$app->db->createCommand("insert into weixin_auth(wx_appid,access_token,expires_in,signature,expires_time,jsapi_ticket) values('$wx_appid','$token','$expires_in','$signature',$expires_in_time,'$jsapi_ticket')")->execute();
                        }else{
                            Yii::$app->db->createCommand("update weixin_auth set access_token='$token',expires_in='$expires_in',signature='$signature',expires_time=$expires_in_time,jsapi_ticket='$jsapi_ticket'")->execute();
                        }
                        $result_data=[
                            'wx_appid'=>$wx_appid,
                            'access_token'=>$token,
                            'expires_in'=>$expires_in,
                            'expires_time'=>$expires_in_time,
                            'signature'=>$signature,
                            'jsapi_ticket'=>$jsapi_ticket
                        ];
                        Helper::setCache($wx_appid,$result_data,$expires_in);
                    }
                }
            }
        }
        $this_url=Yii::$app->request->getHostInfo().Yii::$app->request->url;
        $timestamp=$result_data['expires_time']-$result_data['expires_in'];
        $result_data['signature']=sha1("jsapi_ticket=$result_data[jsapi_ticket]&noncestr=".md5("abc")."&timestamp=$timestamp&url=$this_url");
        return $result_data;
    }

    //添加日志
    public static function inserKNPLOG($number,$type,$total,$content,$user_id,$connect){
		if($type==1){
			$keyong=($total+$number);
		}else{
			$keyong=($total-$number);
		}
        $connect->createCommand("insert into user_knp_log(user_id,surplus,number,total,type,content,createdtime) VALUE ($user_id,$total,$number,".$keyong.",$type,'".$content."',".time().")")->execute();
    }
}
