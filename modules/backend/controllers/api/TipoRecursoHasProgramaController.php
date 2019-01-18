<?php

namespace app\modules\backend\controllers\api;

/**
* This is the class for REST controller "TipoRecursoHasProgramaController".
*/

use yii\filters\AccessControl;
use yii\helpers\ArrayHelper;

class TipoRecursoHasProgramaController extends \yii\rest\ActiveController
{
public $modelClass = 'app\models\TipoRecursoHasPrograma';
}
