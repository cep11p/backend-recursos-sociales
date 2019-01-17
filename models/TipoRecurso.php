<?php

namespace app\models;

use Yii;
use \app\models\base\TipoRecurso as BaseTipoRecurso;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "tipo_recurso".
 */
class TipoRecurso extends BaseTipoRecurso
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
