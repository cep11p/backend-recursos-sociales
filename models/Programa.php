<?php

namespace app\models;

use Yii;
use \app\models\base\Programa as BasePrograma;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "programa".
 */
class Programa extends BasePrograma
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
