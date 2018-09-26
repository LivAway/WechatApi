<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ad".
 *
 * @property string $oid
 * @property string $name
 * @property string $cate_id
 * @property string $pic
 * @property string $url
 * @property integer $sort
 * @property integer $isvalid
 * @property string $start_time
 * @property string $end_time
 * @property string $description
 */
class Ad extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'ad';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cate_id', 'sort', 'isvalid', 'start_time', 'end_time'], 'integer'],
            [['name'], 'string', 'max' => 100],
            [['pic', 'url', 'description'], 'string', 'max' => 200],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'oid' => 'Oid',
            'name' => 'Name',
            'cate_id' => 'Cate ID',
            'pic' => 'Pic',
            'url' => 'Url',
            'sort' => 'Sort',
            'isvalid' => 'Isvalid',
            'start_time' => 'Start Time',
            'end_time' => 'End Time',
            'description' => 'Description',
        ];
    }

    public static function getAdsHtml($cate,$limit=1,$type=null){
        if($limit==1){
            $ressult=Yii::$app->db->createCommand("SELECT * FROM ad WHERE cate_id=$cate  ORDER BY sort asc limit $limit")->queryOne();
            return self::getHtml($ressult,$type);
        }else{
            $ressult=Yii::$app->db->createCommand("SELECT * FROM ad WHERE cate_id=$cate  ORDER BY sort asc limit $limit")->queryAll();
            $html='';
            if(!empty($ressult)){
                foreach ($ressult as $val){
                    $html.=self::getHtml($val,$type);
                }
            }
            if($type<>"banner"){
                $count=$limit-count($ressult);
                if($count>0){
                    for($i=0;$i<$count;$i++){
                        $html.=self::getHtml("",$type);
                    }
                }
                return $html;
            }else{
                return ['html'=>$html,'count'=>count($ressult)];
            }
        }
    }
    public static function getHtml($model=null,$type=null){
        if(!empty($model)){
            $url=!empty($model['url'])?$model['url']:"javascript:void(0)";
            if($type==="banner")
                return '<div class="item_banner"><a href="'.$url.'"><img src="'.Yii::$app->params['adsRoot'].$model['pic'].'" /></a></div>';
            elseif($type=="sex")
                return '<a href="'.$url.'"><span><img src="'.Yii::$app->params['adsRoot'].$model['pic'].'" /></span></a>';
            else
                return '<a href="'.$url.'"><img src="'.Yii::$app->params['adsRoot'].$model['pic'].'" /></a>';
        }else{
            if($type==="banner")
                return '<div class="item_banner"><a class="no_ads" href="javascript:void(0)"><span>广告位</span></a></div>';
            else
                return '<a class="no_ads" href="javascript:void(0)"><span>广告位</span></a>';
        }
    }
    public static function getAds($cate,$limit=1,$is_filter=false){
        if($limit==1){
            $ressult=Yii::$app->db->createCommand("SELECT * FROM ad WHERE cate_id=$cate  ORDER BY sort asc limit $limit")->queryOne();
            if($is_filter){
                $filterResult=[];
                if(!empty($ressult)){
                    $filterResult['name']=$ressult['name'];
                    $filterResult['pic']=Yii::$app->params['adsRoot'].$ressult['pic'];
                    $filterResult['url']=$ressult['url'];
                }
                return $filterResult;
            }else{
                return $ressult;
            }
        }else{
            $ressult = Yii::$app->db->createCommand("SELECT * FROM ad WHERE cate_id=$cate  ORDER BY sort asc limit $limit")->queryAll();
            if($is_filter){
                $filterResult=[];
                if(!empty($ressult)){
                    foreach($ressult as $key=>$val){
                        $filterResult[$key]['name']=$val['name'];
                        $filterResult[$key]['pic']=Yii::$app->params['adsRoot'].$val['pic'];
                        $filterResult[$key]['url']=$val['url'];
                    }
                }
                return $filterResult;
            }else{
                return $ressult;
            }
        }
    }
}
