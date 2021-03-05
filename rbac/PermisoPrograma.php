<?php

namespace app\rbac;

use app\models\Programa;
use Yii;

/**
 * Comprueba si un usuario pertenece a un programa
 */
class PermisoPrograma
{
    /**
    * Se filtra los programas según los permisos del usuario
    *
    * @return array
    */
    static function setCondicionPermisoProgramaVer($table_recurso = 'recurso'){
        $programaid = [];
        $lista_programa = Programa::find()->asArray()->all();

        foreach ($lista_programa as $value) {
            if(Yii::$app->user->can('prestacion_ver',['prestacion' => ['programaid'=>$value['id']]])){
                $programaid[] = $value['id'];
            }
        }
        
        return [$table_recurso.'.programaid'=>$programaid];
    }
}