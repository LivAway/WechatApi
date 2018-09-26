<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "auth_token".
 *
 * @property string $oid
 * @property string $user_id
 * @property string $token
 * @property integer $is_update
 * @property integer $expires_in
 * @property string $duetime
 * @property string $createdtime
 */
class AuthToken extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'auth_token';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'is_update', 'expires_in', 'duetime', 'createdtime'], 'integer'],
            [['token'], 'string', 'max' => 32],
            [['token'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'oid' => 'Oid',
            'user_id' => 'User ID',
            'token' => 'Token',
            'is_update' => 'Is Update',
            'expires_in' => 'Expires In',
            'duetime' => 'Duetime',
            'createdtime' => 'Createdtime',
        ];
    }
}
