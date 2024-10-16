<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%qualification}}".
 *
 * @property int $id
 * @property int|null $user_id
 * @property string|null $startDate
 * @property string|null $endDate
 * @property string|null $qualification
 *
 * @property User $user
 */
class Qualification extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%qualification}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id'], 'integer'],
            [['startDate'], 'match', 'pattern' => '/^\d{2}\.\d{2}\.\d{4}$/', 'message' => 'Не верный формат.'],
            [['endDate'], 'match', 'pattern' => '/^\d{2}\.\d{2}\.\d{4}$/', 'message' => 'Не верный формат.'],
            [['qualification'], 'string', 'max' => 1000],
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
            'startDate' => Yii::t('app', 'Start Date'),
            'endDate' => Yii::t('app', 'End Date'),
            'qualification' => Yii::t('app', 'Qualification'),
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
     * @return \common\models\query\QualificationQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \common\models\query\QualificationQuery(get_called_class());
    }
}
