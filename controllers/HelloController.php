<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace app\controllers;

use yii\console\Controller;
use app\models\User;
use app\helpers;
use Yii;


/**
 * This command echoes the first argument that you have entered.
 *
 * This command is provided as an example for you to learn how to create console commands.
 *
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0T
 */
class HelloController extends Controller
{

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

        ttt();
//        $aa = $this;
//        var_dump($this);
//        return json_decode($aa);

//        return ['code' => 200, 'data' => $aa];

    }


    public function actionGet_info()
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
