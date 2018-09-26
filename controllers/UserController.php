<?php

namespace app\controllers;

use app\commands\BaseActiveController;
use app\helpers\Helper;
use app\models\Ad;
use app\models\ForgetForm;
use app\models\Syscode;
use app\models\User;
use Yii;
class UserController extends BaseActiveController
{
    public $is_token=true;
    public $modelClass = 'app\models\User';

    /***
     * 保存 用户信息
     * @return array
     */
    public function actionSave_info(){
        $learn=$this->getData('learn',true);
        $share=$this->getData('share',true);
        $desc=$this->getData('desc',true);
        $model=User::findOne($this->userId);
        $model->learn=$learn;
        $model->share=$share;
        $model->desc=$desc;
        if($model->save()){
            return ["code"=>200];
        }else{
            return ["code"=>203,"msg"=>"保存失败，请重新再试"];
        }
    }
    /***
     * 获取用户 资料信息 如: 爱好 学习能力 说明
     * @return array
     */
    public function actionGet_info(){
		
        $model=User::findOne($this->userId);
        $share=Yii::$app->db->createCommand("select name from share")->queryAll();
        $learn=Yii::$app->db->createCommand("select name from learn")->queryAll();
        return ['code'=>200,"data"=>[
            "learn"=>!empty($model->learn)?$model->learn:"",
            "share"=>!empty($model->share)?$model->share:"",
            "desc"=>!empty($model->desc)?$model->desc:"",
            "shareOptions"=>$share,
            "learnOptions"=>$learn
            ]
        ];
    }
	
	public function actionViews(){
		 
		 $uid=$this->getData('user_id',true);
		 $uid=(int)$uid;
		 if($uid==0){
			 $uid=$this->userId;
		 }
		 $model=Yii::$app->db->createCommand("select * from user where  oid =".$uid)->queryOne();
	
		 $content=[];
		 if(!empty($model)){
			$comment=Yii::$app->db->createCommand("select * from comment WHERE to_uid=".$model['oid']." order by createdtime desc")->queryAll();
			$content=[
				"oid"=>$model['oid'],
				"nickname"=>$model['nickname'],
				"headpic"=>$model['headpic'],
				"learn"=>$model['learn'],
				"share"=>$model['share'],
				"desc"=>$model['desc'],
				"comment_count"=>$model['comment_count'],
				"comments"=>$comment
				];
		 }
		 return ['code'=>200,'data'=>$content];
	}

    public function actionSearch(){
        $tag=$this->getData('tag',true);
        $keyword=$this->getData('keyword',true);
        $ids=$this->getData('ids');
		$uid=$this->userId;
        if(empty($ids)){
            $ids="0";
        }
        if($tag=="share"){
			if($keyword=="all"){
				$result=Yii::$app->db->createCommand("select * from user where oid not in($ids) AND oid<>$uid order by RAND() LIMIT 5 ")->queryAll();
			}else{
				$result=Yii::$app->db->createCommand("select * from user where share like '%$keyword%' AND oid not in($ids) AND oid<>$uid order by RAND() LIMIT 5 ")->queryAll();
			}
            
        }else{
			if($keyword=="all"){
				$result=Yii::$app->db->createCommand("select * from user where  oid not in($ids) AND oid<>$uid order by RAND() LIMIT 5 ")->queryAll();
			}else{
				$result=Yii::$app->db->createCommand("select * from user where learn like '%$keyword%' AND oid not in($ids) AND oid<>$uid order by RAND() LIMIT 5 ")->queryAll();
			}
        }
        $content=[];
        if(!empty($result)){
            foreach($result as $model){
                $comment=Yii::$app->db->createCommand("select * from comment WHERE to_uid=".$model['oid']." order by createdtime desc")->queryAll();
                $content[]=[
                    "oid"=>$model['oid'],
                    "nickname"=>$model['nickname'],
                    "headpic"=>$model['headpic'],
                    "learn"=>$model['learn'],
                    "share"=>$model['share'],
                    "desc"=>$model['desc'],
                    "comment_count"=>$model['comment_count'],
                    "comments"=>$comment
                    ];
                $ids.=",".$model['oid'];
            }
        }
        return ['code'=>200,'data'=>['list'=>$content,"ids"=>$ids]];
    }
	
	
	public function actionGet_kpn(){
		return ['code'=>200,'data'=>Yii::$app->user->identity->overplus_KNP];
	}
}
