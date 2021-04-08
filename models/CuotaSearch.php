<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Cuota;

/**
* CuotaSearch represents the model behind the search form about `app\models\Cuota`.
*/
    class CuotaSearch extends Cuota
    {
    /**
    * @inheritdoc
    */
    public function rules()
    {
        return [
            [['id', 'recursoid'], 'integer'],
            [['monto'], 'number'],
            [['fecha_pago', 'create_at'], 'safe'],
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
        $query = Cuota::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params,'');

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'monto' => $this->monto,
            'recursoid' => $this->recursoid,
            'fecha_pago' => $this->fecha_pago,
            'create_at' => $this->create_at,
        ]);

        return $dataProvider;
    }
}