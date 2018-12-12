<?php

namespace app\controllers;

use app\commands\BaseActiveController;
use app\models\UserKnpLog;
use yii\console\Controller;
use app\models\User;
use app\helpers;
use Yii;
use yii\helpers\ArrayHelper;


/**
 * This command echoes the first argument that you have entered.
 *
 * This command is provided as an example for you to learn how to create console commands.
 *
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0T
 */
class KindnessController extends BaseActiveController
{
    public $is_token = false;

    public $modelClass = 'app\models\User';


    /**
     * @return array
     * @throws \yii\db\Exception
     */
    public function actionSearch()
    {

        if (!isset($this->params_get['keyword'])) {
            return ['code' => 400, 'reason' => 'Please input keyword', 'data' => []];
        }

        $key_word = $this->params_get['keyword'];

        $results = Yii::$app->db->createCommand("select oid,nickname,username,headpic from user where nickname like '%$key_word%'   order by oid asc limit 5")->queryAll();

        $data = [];
        foreach ($results as $result) {
            $data[] = [
                'nickname' => $result['nickname'],
                'username' => $result['username'],
                'head_pic' => $result['headpic'],
                'id' => $result['oid'],
            ];
        }

        if (count($data) < 1) {
            $reason = 'Keyword ' . $key_word . ' not found';
        } else {
            $reason = 'ok';
        }
        return ['code' => 200, 'reason' => $reason, 'data' => $data];
    }


    public function actionTransfer()
    {
        if (!isset($this->params_get['id']) || !isset($this->params_get['self_id'])) {
            return ['code' => 400, 'reason' => 'Params errors', 'data' => []];
        }
        $user_id = $this->params_get['id'];
        $self_id = $this->params_get['self_id'];

        $result_self = User::findOne($self_id);

        $results = User::findOne($user_id);

        if (!$result_self || !$results) {
            return ['code' => 400, 'reason' => 'Check users id', 'data' => []];
        }

        if (isBlank($result_self['password'])) {
            $is_set_pd = 0;
        } else {
            $is_set_pd = 1;
        }

        $data = [
            'id' => $results['oid'],
            'nickname' => $results['nickname'],
            'username' => $results['username'],
            'head_pic' => $results['headpic'],
            'self_amount' => $result_self['overplus_KNP'],
            'is_set_pd' => $is_set_pd,
        ];

        return ['code' => 200, 'reason' => 'ok', 'data' => $data];
    }

    public function actionPay()
    {
        if (!isset($this->params_get['password']) || !isset($this->params_get['self_id']) || !isset($this->params_get['user_id']) || !isset($this->params_get['amount']) || !isset($this->params_get['note'])) {
            return ['code' => 400, 'reason' => 'Params errors'];
        }

        $password = $this->params_get['password'];
        $self_id = $this->params_get['self_id'];
        $user_id = $this->params_get['user_id'];
        $amount = $this->params_get['amount'];
        $mark_log = $this->params_get['note'];


        $results = user::findOne($user_id);
        $result_self = user::findOne($self_id);

        if (!$result_self || !$results) {
            return ['code' => 400, 'reason' => 'Check users id', 'data' => []];
        }
        $params = [
            'password' => $password,
            'self_id' => $self_id,
        ];

        if (isBlank($result_self['password'])) {

            if (!isset($this->params_get['password_re'])) {
                return ['code' => 400, 'reason' => 'password is empty '];
            }

            if ($this->params_get['password'] != $this->params_get['password_re']) {
                return ['code' => 400, 'reason' => 'Password mismatch'];
            }

            #保存新密码
            $result_self->password = $this->params_get['password'];
            $result_self->save();

        } else {
            if ($result_self['password'] != $params['password']) {
                return ['code' => 400, 'reason' => 'Password errors'];
            }
        }

        #添加资产
        $results->overplus_KNP = (int)bcadd((int)$results->overplus_KNP, (int)$amount);

        #减去资产
        $result_self->overplus_KNP = (int)bcsub((int)$result_self->overplus_KNP, (int)$amount);

        if ($results->save() && $result_self->save()) {
            #添加记录
//            User::inserKNPLOG($amount, 1, 22, "transfer :" . $amount . "knp", $user_id, $connect);

            $knp_log = new UserKnpLog();
            $knp_log->user_id = $user_id;
            $knp_log->surplus = $results->overplus_KNP;
            $knp_log->number = $amount;
            $knp_log->type = 1;
            $knp_log->content = "transfer :" . $amount . "knp from " . $result_self->nickname;
            $knp_log->createdtime = time();
            if ($knp_log->save()) {
//                var_dump('success');
            }

            $knp_log_self = new UserKnpLog();
            $knp_log_self->user_id = $self_id;
            $knp_log_self->surplus = $result_self->overplus_KNP;
            $knp_log_self->number = $amount;
            $knp_log_self->type = 1;
            $knp_log_self->content = "transfer :" . $amount . "knp to " . $results->nickname;
            $knp_log_self->createdtime = time();
            $knp_log_self->save();
//                var_dump('success');

            $data = [
                'note' => $mark_log,
                'amount' => $amount,
                'self_name' => $result_self['nickname'],
                'nickname' => $results['nickname'],
                'head_pic' => $results['headpic'],
            ];

            return ["code" => 200, "reason" => "Success", 'data' => $data];
        } else {
            return ["code" => 400, "reason" => "Data save false"];
        }

    }

    public function actionTest()
    {
        $aa = bcsub(4,1);
        var_dump($aa);


    }

}
