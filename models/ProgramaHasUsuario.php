<?php

namespace app\models;

use Yii;
use \app\models\base\ProgramaHasUsuario as BaseProgramaHasUsuario;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "programa_has_usuario".
 */
class ProgramaHasUsuario extends BaseProgramaHasUsuario
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
