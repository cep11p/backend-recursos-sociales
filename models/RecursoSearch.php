<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Recurso;

/**
* RecursoSearch represents the model behind the search form about `app\models\Recurso`.
*/
class RecursoSearch extends Recurso
{
    /**
    * @inheritdoc
    */
    public function rules()
    {
    return [
        [['id', 'programaid', 'tipo_recursoid', 'personaid'], 'integer'],
        [['fecha_inicial', 'fecha_alta', 'observacion', 'proposito'], 'safe'],
        [['monto'], 'number'],
    ];
    }

    /**
    * @inheritdoc
    */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
    * Creates data provider instance with search query applied
    *
    * @param array $params
    *
    * @return ActiveDataProvider
    */
    public function search($params)
    {
        $query = Recurso::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'fecha_inicial' => $this->fecha_inicial,
            'fecha_alta' => $this->fecha_alta,
            'monto' => $this->monto,
            'programaid' => $this->programaid,
            'tipo_recursoid' => $this->tipo_recursoid,
            'personaid' => $this->personaid,
        ]);

        $query->andFilterWhere(['like', 'observacion', $this->observacion])
            ->andFilterWhere(['like', 'proposito', $this->proposito]);

        return $dataProvider;
    }
    
    public function busquedadGeneral($params)
    {
        $query = Recurso::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'pageSize' => $params['pagesize'],
                'page' => (isset($params['page']) && is_numeric($params['page']))?$params['page']:0
            ],
        ]);

        $this->load($params,'');

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'fecha_inicial' => $this->fecha_inicial,
            'fecha_alta' => $this->fecha_alta,
            'monto' => $this->monto,
            'programaid' => $this->programaid,
            'tipo_recursoid' => $this->tipo_recursoid,
            'personaid' => $this->personaid,
        ]);

        $query->andFilterWhere(['like', 'observacion', $this->observacion])
            ->andFilterWhere(['like', 'proposito', $this->proposito]);

        return $dataProvider;
    }
}