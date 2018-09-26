<?php

namespace app\controllers;

use app\commands\BaseActiveController;
use app\helpers\Helper;
use app\models\Ad;
use app\models\ForgetForm;
use app\models\Syscode;
use app\models\User;
use Yii;
class CommentController extends BaseActiveController
{
    public $is_token=true;
    public $modelClass = 'app\models\User';


    public function actionAdd(){
        $content=$this->getData('content',true);
        $to_id=$this->getData('to_uid',true);
        $meet_id=$this->getData('meet_id',true);

        $knp=$this->getData("knp");
        if(!isset($knp)){
            $knp=0;
        }
        //如果knp>0则 向用户进行了 打赏
        if($knp>0){
            if($knp>Yii::$app->user->identity->overplus_KNP){
                return ["code"=>203,"msg"=>"The user KNP is insufficient, and the current user is only ".Yii::$app->user->identity->overplus_KNP." KNP.","knp"=>Yii::$app->user->identity->overplus_KNP];
            }
        }

        $send_id=$this->userId;
        $connect=Yii::$app->db;
		
		$transaction = $connect->beginTransaction();
		
		
		$bool=true;
		$cid=0;
		try {
			$result=$connect->createCommand("insert into comment(comments_uid,to_uid,content,createdtime) values($send_id,$to_id,'$content',".time().")")->execute();

				$cid=Yii::$app->db->lastInsertID;
				$connect->createCommand("update comment as c INNER JOIN user as send ON send.oid=c.comments_uid INNER JOIN user as u ON u.oid=c.to_uid set c.comments_nickname=send.nickname,c.comments_headpic=send.headpic,c.to_nickname=u.nickname,c.to_headpic=u.headpic WHERE c.oid=".$cid)->execute();
				if($knp>0){
					$connect->createCommand("update user set comment_count=comment_count+1,total_KNP=total_KNP+$knp,overplus_KNP=overplus_KNP+$knp WHERE oid=".$to_id)->execute();
					$connect->createCommand("update user set use_KNP=use_KNP+$knp,overplus_KNP=overplus_KNP-$knp WHERE oid=".$send_id)->execute();
					//日志  待完善
					User::inserKNPLOG($knp,0,Yii::$app->user->identity->overplus_KNP,"评论用户 打赏:".$knp."KNP",$send_id,$connect);
					$to_user=Yii::$app->db->createCommand("select * from `user` where oid=".$to_id)->queryOne();
					User::inserKNPLOG($knp,1,Yii::$app->user->identity->overplus_KNP,"打赏获得:".$knp."KNP",$to_user['oid'],$connect);
				}else{
					$connect->createCommand("update user set comment_count=comment_count+1 WHERE oid=".$to_id)->execute();
				}
				$row=$connect->createCommand("select * from meet WHERE oid=".$meet_id)->queryOne();
				if($row['is_comment']==0){
					$connect->createCommand("update meet set is_comment=1,last_comment_uid=$send_id WHERE oid=".$meet_id)->execute();
				}else if($row['is_comment']==1){
					$connect->createCommand("update meet set is_comment=2 WHERE oid=".$meet_id)->execute();
				}
				$this->sendSysInfo($content,$to_id,$send_id);
		
			$transaction->commit();
		} catch (Exception $e) {
			$transaction->rollBack();
			$bool=false;
		}
		if($bool){
			return ["code"=>200,"comment_id"=>$cid];
		}else{
			return ["code"=>203,"msg"=>"保存失败，请重新再试"];
		}
    }
	
	protected function sendSysInfo($msg,$from_uid,$to_uid){
		$system_ids=$from_uid."_to_".$to_uid;
		$time=time();
		$msg=$msg." System - VincentChan\'s Review for You";
		Yii::$app->db->createCommand("insert into message(from_uid,to_uid,msg,msg_type,send_time,`group`,system_ids) values($from_uid,$to_uid,'$msg',1,".$time.",1,'$system_ids')")->execute();
		$cid1=Yii::$app->db->lastInsertID;
		
		Yii::$app->db->createCommand("update message as c INNER JOIN user as send ON send.oid=c.from_uid INNER JOIN user as u ON u.oid=c.to_uid set c.from_nickname=send.nickname,c.from_headpic=send.headpic,c.to_nickname=u.nickname,c.to_headpic=u.headpic WHERE c.oid=".$cid1)->execute();
		return true;
	}
	
    public function actionList(){
        $to_id=$this->getData('to_id',true);
        $not_id=$this->getData('not_id');
        $is_history=$this->getData('is_history');
        $send_id=$this->userId;
        $last_date=$this->getData('last_date');
        //最后发送id
        $last_id=$this->getData('last_id');
        if(empty($not_id)){
           $not_id=0;
        }
        if(empty($last_id)){
            $last_id=0;
        }
        if(empty($last_date)){
            $last_date=0;
        }

        if($is_history!=1){
            $is_history=0;
        }

        if(!empty($is_history) && $is_history==1){
            $result=Yii::$app->db->createCommand("SELECT * FROM  comment WHERE oid<$last_id and to_uid in($send_id,$to_id) AND comments_uid in ($send_id,$to_id) AND oid <>$not_id order by createdtime desc limit 5 ")->queryAll();
        }else{
            $result=Yii::$app->db->createCommand("SELECT * FROM  comment WHERE oid>$last_id and to_uid in($send_id,$to_id) AND comments_uid in ($send_id,$to_id) AND oid <>$not_id order by createdtime desc limit 5")->queryAll();
        }
        $content=[];
        $date_arr=[];

        if(!empty($result)){
            $last_id=$result[0]['oid'];
            sort($result);
            foreach($result as $model){
                $date=date("m-d H:i",$model['createdtime']);
                if(!in_array($date,$date_arr) && $last_date!=$date){
                    array_push($date_arr,$date);
                    $content[]=['type'=>10,'content'=>$date];
                }
                $model['createdtime']=$date;
                $content[]=$model;
            }
        }
        if(count($date_arr)>0){
            if($is_history==1){
                $last_date=$date_arr[0];
            }else{
                $last_date=$date_arr[(count($date_arr)-1)];
            }
        }
        return ['code'=>200,'data'=>[
            'list'=>$content,
            "last_id"=>$last_id,
            'is_history'=>$is_history,
            'last_date'=>$last_date
        ]];
    }
}
