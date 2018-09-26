<?php

namespace app\controllers;

use app\commands\BaseActiveController;
use app\helpers\Helper;
use app\models\Ad;
use app\models\ForgetForm;
use app\models\Syscode;
use app\models\User;
use Yii;
class SendController extends BaseActiveController
{
    public $is_token=true;
    public $modelClass = 'app\models\User';
	
    /***
     * 保存 用户信息
     * @return array
     */
    public function actionMsg(){
        $msg=$this->getData('content',true);
        $from_uid=$this->userId;
        $to_uid=$this->getData('to_uid',true);
        $msg_type=$this->getData('msg_type',true);
        $group=$this->getData("group");
        if($group!=1){
            $group=0;
        }
        $time=time();
		if($msg_type==1){
			$system_ids=$from_uid."_to_".$to_uid;
			$result=Yii::$app->db->createCommand("insert into message(from_uid,to_uid,msg,msg_type,send_time,`group`,system_ids) values($to_uid,$from_uid,'$msg',$msg_type,".$time.",$group,'$system_ids')")->execute();
		}else{
			$result=Yii::$app->db->createCommand("insert into message(from_uid,to_uid,msg,msg_type,send_time,`group`) values($from_uid,$to_uid,'$msg',$msg_type,".$time.",$group)")->execute();
		}
        
		
		
        if($result){
            $cid=Yii::$app->db->lastInsertID;
            $date=date("m-d H:i",$time);
            Yii::$app->db->createCommand("update message as c INNER JOIN user as send ON send.oid=c.from_uid INNER JOIN user as u ON u.oid=c.to_uid set c.from_nickname=send.nickname,c.from_headpic=send.headpic,c.to_nickname=u.nickname,c.to_headpic=u.headpic WHERE c.oid=".$cid)->execute();
            //见面申请
            if($msg_type==1){
                Yii::$app->db->createCommand("insert into meet(from_uid,to_uid,msg_id,content,createdtime) values($from_uid,$to_uid,$cid,'$msg',".$time.")")->execute();
				$msg="A meet up offline has been agreed,please discuss when and where.It\'s very important thar please <font color=red>write a review</font> to each other after you meet,so that other LivAwayer can use as references.Thank you for your KIDNESS.";
				$msg="Has requested to meet you.";
				$system_ids=$to_uid."_to_".$from_uid;
				Yii::$app->db->createCommand("insert into message(from_uid,to_uid,msg,msg_type,send_time,`group`,system_ids) values($from_uid,$to_uid,'$msg',$msg_type,".$time.",$group,'$system_ids')")->execute();
				$cid1=Yii::$app->db->lastInsertID;
				Yii::$app->db->createCommand("update message as c INNER JOIN user as send ON send.oid=c.from_uid INNER JOIN user as u ON u.oid=c.to_uid set c.from_nickname=send.nickname,c.from_headpic=send.headpic,c.to_nickname=u.nickname,c.to_headpic=u.headpic WHERE c.oid=".$cid1)->execute();
				 
            }
            return ["code"=>200,"msg_id"=>$cid,"date"=>$date];
        }else{
            return ["code"=>203,"msg"=>"保存失败，请重新再试"];
        }
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
		Yii::$app->db->createCommand("update message set is_read=1 where is_read=0 AND to_uid=".$send_id)->execute();
		$system_ids=$send_id."_to_".$to_id;
        if(!empty($is_history) && $is_history==1){
            $result=Yii::$app->db->createCommand("SELECT * FROM  message WHERE oid<$last_id and ((from_uid in($send_id,$to_id) AND to_uid in ($send_id,$to_id) AND oid not in ($not_id) AND system_ids='0') or system_ids='$system_ids') order by oid desc limit 5 ")->queryAll();
        }else{
            $result=Yii::$app->db->createCommand("SELECT * FROM  message WHERE oid>$last_id and ((from_uid in($send_id,$to_id) AND to_uid in ($send_id,$to_id) AND oid not in ($not_id) AND system_ids='0') or system_ids='$system_ids') order by oid desc limit 5")->queryAll();
        }
        $content=[];
        $date_arr=[];
        $first_id="";
        if(!empty($result)){
            $last_id=$result[0]['oid'];
            sort($result);
            $first_id=$result[0]['oid'];
            foreach($result as $model){
                $date=date("m-d H:i",$model['send_time']);
                if((!in_array($date,$date_arr) && $last_date!=$date) || $is_history==1){
                    array_push($date_arr,$date);
                    $content[]=['msg_type'=>10,'msg'=>$date];
                }
                $model['send_time']=$date;
                $model['is_self']=$model['from_uid']==$send_id?1:0;
                $content[]=$model;
            }
        }
        $first_date="";
        if(count($date_arr)>0){
                $first_date=$date_arr[0];
                $last_date=$date_arr[(count($date_arr)-1)];
        }
        if(count($result)==0 && $not_id!="0"){
            $last_id=$not_id;
        }
        $meet=Yii::$app->db->createCommand("select *,(select nickname from user where oid=meet.from_uid) as nickname from meet where from_uid in(".$send_id.",$to_id) AND to_uid in(".$send_id.",".$to_id.") AND is_comment=0 order by oid desc")->queryOne();
        if(!empty($meet)){
            $meet["is_self"]=$meet['from_uid']==$send_id?1:0;
        }
        return ['code'=>200,'data'=>[
            'list'=>$content,
            "last_id"=>$last_id,
            'is_history'=>$is_history,
            'last_date'=>$last_date,
            'count'=>count($result),
            'first_id'=>$first_id,
            'first_date'=>$first_date,
            'meet'=>$meet
        ]];
    }

    //获取用户未读信息
    public function actionUnread(){
        $to_uid=$this->userId;
        $result=Yii::$app->db->createCommand("SELECT * FROM  message WHERE to_uid =$to_uid AND is_read=0  GROUP BY from_uid order by send_time desc")->queryAll();
        $content=[];
        if(!empty($result)){
            foreach($result as $model){
                $rows=Yii::$app->db->createCommand("SELECT * FROM  message WHERE to_uid =$to_uid AND is_read=0 AND from_uid=$model[from_uid] order by oid desc")->queryAll();
                $content[]=[
                    "from_uid"=>$rows[0]['from_uid'],
                    'from_nickname'=>$rows[0]['from_nickname'],
                    'from_headpic'=>$rows[0]['from_headpic'],
					'msg'=>$rows[0]['msg'],
					'msg_type'=>$rows[0]['msg_type'],
					'send_time'=>date("H-d,H:i:s",$rows[0]['send_time']),
                    'count'=>count($rows)
                ];
            }
        }
		return ['code'=>200,'data'=>$content];
    }
	
	public function actionJianmian(){
        $send_id=$this->userId;
        $meet_id=$this->getData('meet_id',true);
		$to_id=$this->getData('to_id',true);
		$time=time();
		
		$result=Yii::$app->db->createCommand("update meet set status=1,agreedtime=$time  where oid =$meet_id")->execute();

		if($result){
			$msg="A meet up offline has been agreed,please discuss when and where.It\'s very important thar please <font color=red>write a review</font> to each other after you meet,so that other LivAwayer can use as references.Thank you for your KIDNESS.";
			$this->sendSysInfo($msg,$send_id,$to_id);
			$msg="ANeeds your review";
			$this->sendSysInfo($msg,$send_id,$to_id);
		}
		return ['code'=>200];
	}
	protected function sendSysInfo($msg,$from_uid,$to_uid){
		$system_ids=$from_uid."_to_".$to_uid;
		$time=time();
		Yii::$app->db->createCommand("insert into message(from_uid,to_uid,msg,msg_type,send_time,`group`,system_ids) values($from_uid,$to_uid,'$msg',1,".$time.",1,'$system_ids')")->execute();
		$cid1=Yii::$app->db->lastInsertID;
		
		Yii::$app->db->createCommand("update message as c INNER JOIN user as send ON send.oid=c.from_uid INNER JOIN user as u ON u.oid=c.to_uid set c.from_nickname=send.nickname,c.from_headpic=send.headpic,c.to_nickname=u.nickname,c.to_headpic=u.headpic WHERE c.oid=".$cid1)->execute();
		return true;
	}
}
