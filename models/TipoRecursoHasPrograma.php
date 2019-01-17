<?php

namespace app\models;

use Yii;
use \app\models\base\TipoRecursoHasPrograma as BaseTipoRecursoHasPrograma;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "tipo_recurso_has_programa".
 */
class TipoRecursoHasPrograma extends BaseTipoRecursoHasPrograma
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
