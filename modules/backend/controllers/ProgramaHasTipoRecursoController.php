<?php

namespace app\modules\backend\controllers;
use yii\filters\AccessControl;

/**
* This is the class for controller "ProgramaHasTipoRecursoController".
*/
class ProgramaHasTipoRecursoController extends \app\modules\backend\controllers\base\ProgramaHasTipoRecursoController
{
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['usuario_soporte'],
                    ],
                ],
            ],
        ];
    }

}
