<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%job}}".
 *
 * @property int $id
 * @property int|null $user_id
 * @property string|null $year
 * @property string|null $job
 *
 * @property User $user
 */
class Job extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%job}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id'], 'integer'],
            [['job'], 'string', 'max' => 1000],
            [['year'], 'match', 'pattern' => '/^\d{4}-\d{4}$/', 'message' => 'Не верный формат.'],
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
            'year' => Yii::t('app', 'Year'),
            'job' => Yii::t('app', 'Job'),
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
     * @return \common\models\query\JobQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \common\models\query\JobQuery(get_called_class());
    }
}
