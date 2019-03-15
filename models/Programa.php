<?php

namespace app\models;

use Yii;
use \app\models\base\Programa as BasePrograma;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "programa".
 */
class Programa extends BasePrograma
{
    /**
     * variable auxiliar
     * cuantifica la cantidad de recursos que tiene un programa
     * @var int 
     */
    public $recurso_cantidad;
    
    /**
     * variable auxiliar
     * cuantifica la cantidad de persona que tiene un programa
     * @var int 
     */
    public $persona_cantidad;
    
    /**
     * Variable auxiliar para filtrado
     * Es el monto total de cada programa
     * @var double 
     */
    public $monto;

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
