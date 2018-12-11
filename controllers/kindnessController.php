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
     * This command echoes what you have entered as the message.
     * @param string $message the message to be echoed.
     */
    public function actionIndex($message = 'hello world')
    {
        echo $message . "\n";
    }

    public function actionTest()
    {

        $model = User::findOne(12);
//        var_dump($model);
//        printf( $model);
//        print_r($model);

//        $aa = $this;
//        var_dump($this);
//        return json_decode($aa);
//        return ['code' => 200, 'data' => $aa];

    }

    /**
     * @return array
     * @throws \yii\db\Exception
     */
    public function actionSearch()
    {
        $key_word = $this->params_get['keyword'];

        if (isBlank($key_word)) {
            return ['code' => 400, 'reason' => 'please input keyword', 'data' => []];
        }

        $results = Yii::$app->db->createCommand("select oid,nickname,username,headpic from user where nickname like '%$key_word%'   order by oid asc limit 5")
            ->queryAll();

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

        if (isBlank($user_id)) {
            return ['code' => 400, 'reason' => 'params errors', 'data' => []];
        }

        $results = Yii::$app->db->createCommand("select oid,nickname,password,username,headpic from user where oid=" . $user_id)->queryOne();


        if (isBlank($results['password'])) {
            $is_set_pd = 0;
        } else {
            $is_set_pd = 1;
        }

        $data = [
            'oid' => $results['oid'],
            'nickname' => $results['nickname'],
            'username' => $results['username'],
            'head_pic' => $results['headpic'],
            'amount' => $results['amount'],
            'is_set_pd' => $is_set_pd,
        ];

//        rray(4) { ["oid"]=> string(1) "1" ["nickname"]=> string(4) "Even" ["username"]=> string(15) "weixin_oo4IKxDF" ["headpic"]=> string(133) "http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI9q8ic0ISibeVr5VMna6wCvhdo41vicaPUvRmdNkJAsuhCiaibVjMycmUwKl8xT13mibFbJmsFYfhPNX6A/132" }


    }

    public function actionPay()
    {

    }


    public function actionGetnfo()
    {

        $model = User::findOne(2);
        $share = Yii::$app->db->createCommand("select name from share")->queryAll();
        $learn = Yii::$app->db->createCommand("select name from learn")->queryAll();
        return ['code' => 200, "data" => [
            "learn" => !empty($model->learn) ? $model->learn : "",
            "share" => !empty($model->share) ? $model->share : "",
            "desc" => !empty($model->desc) ? $model->desc : "",
            "shareOptions" => $share,
            "learnOptions" => $learn
        ]
        ];
    }
}
