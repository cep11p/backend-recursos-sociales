<?php

namespace app\modules\backend\controllers\api;

/**
* This is the class for REST controller "ProgramaController".
*/

use yii\filters\AccessControl;
use yii\helpers\ArrayHelper;

class ProgramaController extends \yii\rest\ActiveController
{
public $modelClass = 'app\models\Programa';
}
