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
        
        foreach ($dataProvider->models as $value) {
            $arrayModel = $value->toArray();            
            $coleccion[] = $arrayModel;
        }
        
        $resultado = $this->vincularListaResponsable($coleccion);
        return $resultado;
    }
}