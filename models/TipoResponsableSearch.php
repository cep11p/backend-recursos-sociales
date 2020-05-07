<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Programa;

/**
* ProgramaSearch represents the model behind the search form about `app\models\Programa`.
*/
class TipoResponsableSearch extends TipoResponsable
{
    
    public function busquedaGeneral($params)
    {
        $query = TipoResponsable::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params,'');


        $query->andFilterWhere([
            'id' => $this->id,
        ]);

        $query->andFilterWhere(['like', 'nombre', $this->nombre]);
        
        $parametrosLugar = $parametrosLugar = \Yii::$app->lugar->obtenerParametro();
        $coleccion = array();
        foreach ($dataProvider->models as $value) {
            $arrayModel = $value->toArray();
            if($value['id'] == Recurso::TIPO_RESPONSABLE_COMISION_FOMENTO){
                $arrayModel['lista_responsable'] = $parametrosLugar['comision_fomento'];
            }else if($value['id'] == Recurso::TIPO_RESPONSABLE_MUNICIPIO){
                $arrayModel['lista_responsable'] = $parametrosLugar['municipio'];
            }else if($value['id'] == Recurso::TIPO_RESPONSABLE_DELEGACION){
                $arrayModel['lista_responsable'] = $parametrosLugar['delegacion'];
            }
            
            $coleccion[] = $arrayModel;
        }
        
        return $coleccion;
    }
}