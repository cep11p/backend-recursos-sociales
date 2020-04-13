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
    
    public function getListaResponsable() {
        $resultado = array();
        if($this->nombre == 'municipio'){
            $resultado = \Yii::$app->lugar->buscarMunicipio();
        }else if($this->nombre == 'delegacion'){
            $resultado = \Yii::$app->lugar->buscarDelegacion();
        }else if($this->nombre == 'comision de fomento'){
            $resultado = \Yii::$app->lugar->buscarComisionFomento();
        }
        return $resultado;
    }


    public function fields()
    {
        return ArrayHelper::merge(parent::fields(), [
            'nombre'=> function($model){
                return ucfirst($model->nombre);
            },
            #Se prepara la lista del tipo de responsable
            'lista_responsable'=> function($model){
                return $model->listaResponsable;
            }
        ]);        
    }
}
