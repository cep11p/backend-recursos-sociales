<?php

namespace app\modules\backend\controllers\api;

/**
* This is the class for REST controller "TipoRecursoController".
*/

use yii\filters\AccessControl;
use yii\helpers\ArrayHelper;

class TipoRecursoController extends \yii\rest\ActiveController
{
public $modelClass = 'app\models\TipoRecurso';
}
