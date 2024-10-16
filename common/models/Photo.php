<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%photo}}".
 *
 * @property int $id
 * @property int|null $user_id
 * @property string|null $photo
 *
 * @property User $user
 */
class Photo extends \yii\db\ActiveRecord
{
    public $newphoto;

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%photo}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id'], 'integer'],
            [['newphoto'], 'file', 'extensions' => ['jpg', 'jpeg', 'png']],
            [['photo'], 'string', 'max' => 255],
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
            'photo' => Yii::t('app', 'Photo'),
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
     * @return \common\models\query\PhotoQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \common\models\query\PhotoQuery(get_called_class());
    }
}
