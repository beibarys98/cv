<?php

namespace common\models\query;

/**
 * This is the ActiveQuery class for [[\common\models\Prize]].
 *
 * @see \common\models\Prize
 */
class PrizeQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * {@inheritdoc}
     * @return \common\models\Prize[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * {@inheritdoc}
     * @return \common\models\Prize|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
