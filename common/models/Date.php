<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%date}}".
 *
 * @property int $id
 * @property int|null $user_id
 * @property string|null $date
 *
 * @property User $user
 */
class Date extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%date}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id'], 'integer'],
            [['date'], 'match', 'pattern' => '/^\d{2}\.\d{2}\.\d{4}$/', 'message' => 'Не верный формат.'],
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
            'date' => Yii::t('app', 'Date'),
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
     * @return \common\models\query\DateQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \common\models\query\DateQuery(get_called_class());
    }
}
