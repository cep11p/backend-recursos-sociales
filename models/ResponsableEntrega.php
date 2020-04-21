<?php

namespace app\models;

use Yii;
use \app\models\base\ResponsableEntrega as BaseResponsableEntrega;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "responsable_entrega".
 */
class ResponsableEntrega extends BaseResponsableEntrega
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
