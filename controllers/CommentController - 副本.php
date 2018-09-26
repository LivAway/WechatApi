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
        $send_id=$this->userId;
        $result=Yii::$app->db->createCommand("insert into comment(comments_uid,to_uid,content,createdtime) values($send_id,$to_id,'$content',".time().")")->execute();

        if($result){
            $cid=Yii::$app->db->lastInsertID;
            Yii::$app->db->createCommand("update comment as c INNER JOIN user as send ON send.oid=c.comments_uid INNER JOIN user as u ON u.oid=c.to_uid set c.comments_nickname=send.nickname,c.comments_headpic=send.headpic,c.to_nickname=u.nickname,c.to_headpic=u.headpic WHERE c.oid=".$cid)->execute();
            Yii::$app->db->createCommand("update user set comment_count=(comment_count+1) WHERE oid=".$to_id)->execute();
            Yii::$app->db->createCommand("update meet set is_comment=1 WHERE oid=".$meet_id)->execute();
			$result=Yii::$app->db->createCommand("SElect * from meet where oid=".$meet_id)->queryOne();
			//删除重复见面申请记录
			if(!empty($result)){
				Yii::$app->db->createCommand("delete from meet where oid<".$result['oid']." AND from_uid in(".$result['from_uid'].",".$result['to_uid'].") AND to_uid in(".$result['from_uid'].",".$result['to_uid'].") AND status=0")->execute();
			}
			//$this->sendSysInfo($msg,$send_id,to_id);
            return ["code"=>200,"comment_id"=>$cid];
        }else{
            return ["code"=>203,"msg"=>"保存失败，请重新再试"];
        }
    }
	
	protected function sendSysInfo($msg,$from_uid,$to_uid){
		$system_ids=$from_uid."_to_".$to_uid;
		$time=time();
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
