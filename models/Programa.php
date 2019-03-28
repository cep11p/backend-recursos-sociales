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
    /**
     * Variable auxiliar para filtrado
     * Es el monto acreditado por programa
     * @var double 
     */
    public $monto_acreditado;
    /**
     * Variable auxiliar para filtrado
     * Es el monto baja por programa
     * @var double 
     */
    public $monto_baja;
    /**
     * Variable auxiliar para filtrado
     * Es la cantidad de recursos de baja por programa
     * @var int
     */
    public $recurso_baja_cantidad;
    /**
     * Variable auxiliar para filtrado
     * Es la cantidad de recursos de baja por programa
     * @var int
     */
    public $recurso_acreditado_cantidad;

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
