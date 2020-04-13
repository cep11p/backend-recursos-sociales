<?php

namespace app\models;

use Yii;
use \app\models\base\Responsable as BaseResponsable;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "responsable".
 */
class Responsable extends BaseResponsable
{

    public function behaviors()
    {
        return ArrayHelper::merge(
            parent::behaviors(),
            [
                # custom behaviors
            ]
        );
    }

    public function rules()
    {
        return ArrayHelper::merge(
            parent::rules(),
            [
                # custom validation rules
            ]
        );
    }
}
