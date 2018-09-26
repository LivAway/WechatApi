<?php

namespace app\helpers;
use Yii;
class Helper{
    public static function setCache($key,$content,$duration=0){
        return Yii::$app->cache->set($key,$content,$duration);
    }
    public static function getCache($key){
        return Yii::$app->cache->get($key);
    }

    public static function deleteCache($key){
        return Yii::$app->cache->delete($key);
    }

    public static function getKeyValue($key){
        $result=self::getCache($key);
        if($result==false){
            $result=Yii::$app->db->createCommand("SELECT `value` FROM config WHERE `key`='$key'")->queryScalar();
            if(!empty($result)){
                self::setCache($key,$result);
            }
        }
        return $result;
    }

    public static function getKeyValueArr($key){
        $result=self::getKeyValue($key);
        $result=$arrIds = explode('|',$result);
        return $result;
    }

    public static function getActicle($cate_id){
        $key="article_".$cate_id;
        $newArr=self::getCache($key);
        if($newArr==false){
            $result=Yii::$app->db->createCommand("SELECT * FROM article WHERE cate_id=$cate_id AND isvalid=1 order by sort asc")->queryAll();
            if(!empty($result)){
                foreach ($result as $val){
                    $newArr[$val['oid']]=$val;
                }
                self::setCache($key,$newArr);
            }
        }
        return $newArr;
    }

    public static function checkMobileEmail($number){
        $reg ='/^1[3|4|5|6|7|9|8][0-9]\d{8}$/';
        $regEmail ='/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/';
        if(!preg_match($reg,$number) && !preg_match($regEmail,$number)) {
            return false;
        }
        return true;
    }
}
