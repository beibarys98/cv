<?php

namespace common\models\query;

/**
 * This is the ActiveQuery class for [[\common\models\Date]].
 *
 * @see \common\models\Date
 */
class DateQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * {@inheritdoc}
     * @return \common\models\Date[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * {@inheritdoc}
     * @return \common\models\Date|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
