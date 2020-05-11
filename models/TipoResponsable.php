<?php

namespace app\models;

use Yii;
use \app\models\base\TipoResponsable as BaseTipoResponsable;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "tipo_responsable".
 */
class TipoResponsable extends BaseTipoResponsable
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
    

    public function fields()
    {
        return ArrayHelper::merge(parent::fields(), [
            'nombre'=> function($model){
                return ucfirst($model->nombre);
            }
        ]);        
    }
    
    /**
     * Se vincula un listado de responsable en cada tipo de responsable
     * @param array $tipoResponsables
     * @return array
     */
    public function vincularListaResponsable($tipoResponsables) {
        $parametrosLugar = \Yii::$app->lugar->obtenerParametroPersonalizado(["delegacion"=>[],"municipio"=>[],"comision_fomento"=>[]]);
        $resultado = array();
        foreach ($tipoResponsables as $value) {
            if($value['id'] == Recurso::TIPO_RESPONSABLE_COMISION_FOMENTO){
                $value['lista_responsable'] = $parametrosLugar['comision_fomento'];
            }else if($value['id'] == Recurso::TIPO_RESPONSABLE_MUNICIPIO){
                $value['lista_responsable'] = $parametrosLugar['municipio'];
            }else if($value['id'] == Recurso::TIPO_RESPONSABLE_DELEGACION){
                $value['lista_responsable'] = $parametrosLugar['delegacion'];
            }
            
            $resultado[] = $value;
        }
        return $resultado;
    }
}
