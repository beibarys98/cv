<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%mail}}".
 *
 * @property int $id
 * @property int|null $user_id
 * @property string|null $mail
 *
 * @property User $user
 */
class Mail extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%mail}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id'], 'integer'],
            [['mail'], 'email', 'message' => 'Не верный формат.'],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::class, 'targetAttribute' => ['user_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'user_id' => Yii::t('app', 'User ID'),
            'mail' => Yii::t('app', 'Mail'),
        ];
    }

    /**
     * Gets query for [[User]].
     *
     * @return \yii\db\ActiveQuery|\common\models\query\UserQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::class, ['id' => 'user_id']);
    }

    /**
     * {@inheritdoc}
     * @return \common\models\query\MailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \common\models\query\MailQuery(get_called_class());
    }
}
