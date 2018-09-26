<?php

namespace app\models;

use app\helpers\Helper;
use Yii;
use yii\helpers\Url;

/**
 * This is the model class for table "goods_category".
 *
 * @property string $oid
 * @property string $name
 * @property integer $sort
 * @property string $description
 * @property string $keyword
 * @property string $parent_id
 * @property integer $isvalid
 * @property string $path_name
 * @property string $path_ids
 * @property string $createdtime
 */
class GoodsCategory extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'goods_category';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['sort', 'parent_id', 'isvalid', 'createdtime'], 'integer'],
            [['name', 'description', 'keyword', 'path_name', 'path_ids'], 'string', 'max' => 200],
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
            'sort' => 'Sort',
            'description' => 'Description',
            'keyword' => 'Keyword',
            'parent_id' => 'Parent ID',
            'isvalid' => 'Isvalid',
            'path_name' => 'Path Name',
            'path_ids' => 'Path Ids',
            'createdtime' => 'Createdtime',
        ];
    }

    /**
    *   获取二级分类菜单html
     **/
    public static function cateMenuHtml($parent_id,$width){
        $result=self::getCate($parent_id);
        $count=count($result);
        $minHeight=60*$count;
        if($parent_id==1 || $parent_id==5 ){
            $html='<div style="min-height:'.$minHeight.'px;width:408px;" class="home_cate_panel">
                <span class="cate_jiantou"></span>
                <div class="one_category">';
        }else{
            $html='<div style="min-height:'.$minHeight.'px" class="home_cate_panel">
                <span class="cate_jiantou"></span>
                <div class="one_category">';
        }


        $adsHtml='';
        foreach($result as $key=>$val){
            $twoCate=self::getCate($val['oid']);
            if(!empty($twoCate)){
                $data_width="580px";
            }else{
                $data_width="408px";
            }
            if($key==0){
                $html.='<div data-width="'.$data_width.'" class="item_cate one_item_cate active_one">';
            }else{
                $html.='<div  data-width="'.$data_width.'" class="item_cate one_item_cate">';
            }
            $html.='    <a class="two_a" href="'.Url::to(['goods/index','id'=>$val['path_ids']]).'">'.$val['name'].'</a>';
                if(!empty($twoCate)){
                    $twoHtml='';
                    $twoHtml.='<div style="top:-'.($key*60).'px" class="two_category">';
                    foreach ($twoCate as $tkey=>$cate2){
                        if($cate2['oid']==8){
                            $ads=Ad::getAdsHtml(7);
                        }elseif($cate2['oid']==9){
                            $ads=Ad::getAdsHtml(8);
                        }elseif($cate2['oid']==10){
                            $ads=Ad::getAdsHtml(9);
                        }elseif($cate2['oid']==14){
                            $ads=Ad::getAdsHtml(10);
                        }elseif($cate2['oid']==15){
                            $ads=Ad::getAdsHtml(11);
                        }elseif($cate2['oid']==16){
                            $ads=Ad::getAdsHtml(12);
                        }elseif($cate2['oid']==17){
                            $ads=Ad::getAdsHtml(13);
                        }elseif($cate2['oid']==18){
                            $ads=Ad::getAdsHtml(14);
                        }elseif($cate2['oid']==20){
                            $ads=Ad::getAdsHtml(15);
                        }elseif($cate2['oid']==21){
                            $ads=Ad::getAdsHtml(16);
                        }elseif($cate2['oid']==22){
                            $ads=Ad::getAdsHtml(17);
                        }elseif($cate2['oid']==25){
                            $ads=Ad::getAdsHtml(18);
                        }elseif($cate2['oid']==26){
                            $ads=Ad::getAdsHtml(19);
                        }else{
                            $ads="";
                        }
                        if($tkey==0){
                            $twoHtml.='<div data-width="'.$data_width.'" class="item_cate active_two">';
                        }else{
                            $twoHtml.='<div data-width="'.$data_width.'" class="item_cate">';
                        }
                        $twoHtml.='<a class="three_a" href="'.Url::to(['goods/index','id'=>$cate2['path_ids']]).'">'.$cate2['name'].'</a>';
                        $adsHtml='<div style="top:-'.($tkey*60).'px" class="one_category_ads">
                                        '.$ads.'
                                    </div>';
                        $twoHtml.=$adsHtml.'</div>';
                    }
                    $twoHtml.='</div>';
                    $html.=$twoHtml;
                }else{
                    if($val['oid']==6){
                        $ads=Ad::getAdsHtml(6);
                    }elseif($val['oid']==13){
                        $ads=Ad::getAdsHtml(25);
                    }elseif($val['oid']==24){
                        $ads=Ad::getAdsHtml(20);
                    }elseif($val['oid']==27){
                         $ads=Ad::getAdsHtml(21);
                    }elseif($val['oid']==28){
                        $ads=Ad::getAdsHtml(22);
                    }elseif($val['oid']==29){
                        $ads=Ad::getAdsHtml(23);
                    }elseif($val['oid']==30){
                        $ads=Ad::getAdsHtml(24);
                    }else{
                        $ads="";
                    }
                    $adsHtml='<div style="top:-'.($key*60).'px" class="one_category_ads one_category_ads_1">
                                        '.$ads.'
                                    </div>';
                    $html.=$adsHtml;
                }
            $html.=' </div>';
        }
        $html.='</div>
                </div>';
        return $html;
    }

    public static function getCate($parent_id){
        return Yii::$app->db->createCommand("SELECT * FROM goods_category WHERE parent_id=$parent_id and isvalid=1 ORDER BY sort asc,oid asc")->queryAll();
    }
    public static function getPathCate($cate_ids){
        $data=Helper::getCache("cate_ids_".$cate_ids);
        if($data==false){
            $result=Yii::$app->db->createCommand("SELECT oid,name,path_ids,child_ids,parent_id FROM goods_category WHERE oid in($cate_ids) and isvalid=1 ORDER BY sort asc,oid asc")->queryAll();
            $data=[];
            $level=-1;
            $parent=[];
            foreach ($result as $key=>$val){
                if(array_key_exists($val['parent_id'],$parent)){
                    $level=$parent[$val['parent_id']];
                }else{
                    $level++;
                }
                $parent[$val['parent_id']]=$level;
                if($level>1){
                    $data[$val['parent_id']][]=$val;
                }else{
                    $data[$level][]=$val;
                }

            }
            Helper::setCache("cate_ids_".$cate_ids,$data);
        }
        if(!empty($data)){
            $listCate=$data[0][0];
            foreach($data[1] as $key=>$val){
                if($val['oid']!=$val['child_ids']){
                        foreach($data[$val['oid']] as $cate){
                            $val['child'][]=$cate;
                        }
                }
                $listCate['child'][]=$val;
            }
        }else{
            $listCate=[];
        }
        return $listCate;
    }
    public static function getCateIds($ids){
        $arrIds = explode(',',$ids);
        $id=$arrIds[0];
        $data=Helper::getCache("first_id_".$id);
        if($data==false){
            $data=Yii::$app->db->createCommand("select child_ids,path_name from goods_category WHERE oid=".$id)->queryOne();
            Helper::setCache("first_id_".$id,$data);
        }
        if(count($arrIds)==1){
            $child_result=$data;
        }else{
            $cid=$arrIds[count($arrIds)-1];
            $child_result=Helper::getCache("first_id_".$cid);
            if($child_result==false){
                $child_result=Yii::$app->db->createCommand("select child_ids,path_name from goods_category WHERE oid=".$cid)->queryOne();

                Helper::setCache("first_id_".$cid,$child_result);
            }
        }
        return [
            'first_ids'=>$data['child_ids'],
            'first_name'=>$data['path_name'],
            'child_ids'=>$child_result['child_ids'],
            'path_name'=>$child_result['path_name']
        ];
    }
}
