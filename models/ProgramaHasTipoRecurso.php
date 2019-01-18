<?php

namespace app\models;

use Yii;
use \app\models\base\ProgramaHasTipoRecurso as BaseProgramaHasTipoRecurso;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "programa_has_tipo_recurso".
 */
class ProgramaHasTipoRecurso extends BaseProgramaHasTipoRecurso
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
