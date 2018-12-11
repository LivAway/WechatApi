<?php

namespace app\controllers;

use app\commands\BaseActiveController;
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
class kindnessController extends BaseActiveController
{
    public $is_token = false;

    public $modelClass = 'app\models\User';


    /**
     * @return array
     * @throws \yii\db\Exception
     */
    public function actionSearch()
    {
        $key_word = $this->params_get['keyword'];

        if (isBlank($key_word)) {
            return ['code' => 400, 'reason' => 'Please input keyword', 'data' => []];
        }

        $results = Yii::$app->db->createCommand("select oid,nickname,username,headpic from user where nickname like '%$key_word%'   order by oid asc limit 5")->queryAll();

        $data = [];
        foreach ($results as $result) {
            $data[] = [
                'nickname' => $result['nickname'],
                'username' => $result['username'],
                'icon' => $result['headpic'],
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

        $user_id = $this->params_get['id'];
        $self_id = $this->params_get['self_id'];

        if (isBlank($user_id) || isBlank($self_id)) {
            return ['code' => 400, 'reason' => 'params errors', 'data' => []];
        }

//        $results = yii::$app->db->createcommand("select oid,nickname,password,username,headpic from user where oid=" . $user_id)->queryone();
//
//        $result_self = yii::$app->db->createcommand("select oid,nickname,password,username,headpic from user where oid=" . $self_id)->queryone();

        $result_self = User::findOne($self_id);

        $results = User::findOne($user_id);

        if (isBlank($result_self['password'])) {
            $is_set_pd = 0;
        } else {
            $is_set_pd = 1;
        }

        $data = [
            'oid' => $results['oid'],
            'nickname' => $results['nickname'],
            'username' => $results['username'],
            'head_pic' => $results['headpic'],
            'self_amount' => $result_self['amount'],
            'is_set_pd' => $is_set_pd,
        ];

        return ['code' => 200, 'reason' => 'ok', 'data' => $data];
    }

    public function actionPay()
    {
        $password = $this->params_get['password'];
        $password_re = $this->params_get['password_re'];
        $self_id = $this->params_get['self_id'];
        $user_id = $this->params_get['user_id'];
        $amount = $this->params_get['amount'];
        $mark_log = $this->params['note'];

        if (isBlank($amount) || isBlank($user_id) || isBlank($self_id) || isBlank($password) || isBlank($mark_log)) {
            return ['code' => 400, 'reason' => 'Params errors'];
        }

        $result_self = user::findOne($self_id);

        $params = [
            'password' => $password,
            'password_re' => $password_re,
            'self_id' => $self_id,
        ];

        if (isBlank($result_self['password'])) {
            if ($params['password'] != $params['password_re']) {
                return ['code' => 400, 'reason' => 'Password mismatch'];

            }
        } else {
            if ($result_self['password'] != $params['password']) {
                return ['code' => 400, 'reason' => 'Password errors'];
            }
        }

        $model = user::findOne($user_id);
        $model->overplus_knp = (int)bcadd((int)$model->overplus_knp, (int)$amount);
        if ($model->save()) {

            $connect = yii::$app->db;

            User::inserKNPLOG($amount, 1, yii::$app->user->identity->overplus_KNP, "transfer :" . $amount . "knp",
                $user_id, $connect);

            return ["code" => 200, "msg" => "Success"];
        } else {
            return ["code" => 400, "msg" => "Data save false"];
        }

    }

}
