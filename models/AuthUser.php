<?php
/**
 * Created by PhpStorm.
 * User: yaolei
 * Date: 2017/3/13
 * Time: 23:27
 */

namespace app\models;


use yii\filters\auth\AuthMethod;
use yii\web\IdentityInterface;
use yii\web\Request;
use yii\web\Response;
use yii\web\UnauthorizedHttpException;
use yii\web\User;

class AuthUser extends AuthMethod
{

    public $tokenParam = 'access-token';
    /**
     * @inheritdoc
     */
    public function authenticate($user, $request, $response)
    {
        $accessToken = $request->get($this->tokenParam);
        if(empty($accessToken)){
            $accessToken=$request->post($this->tokenParam);
        }
//        $identity = $user->loginByAccessToken($accessToken, get_class($this));
        if (is_string($accessToken)) {
            $identity = $user->loginByAccessToken($accessToken, get_class($this));
            if ($identity !== null) {
                return $identity;
            }
        }
        exit(json_encode(['code'=>'301','msg'=>'用户登录已经过期，或者不存在']));
    }
}