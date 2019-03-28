<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Programa;

/**
* ProgramaSearch represents the model behind the search form about `app\models\Programa`.
*/
class ProgramaSearch extends Programa
{
    /**
    * @inheritdoc
    */
    public function rules()
    {
        return [
            [['id', 'activo'], 'integer'],
            [['nombre'], 'safe'],
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
        $query = Programa::find();

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
            'activo' => $this->activo,
        ]);

        $query->andFilterWhere(['like', 'nombre', $this->nombre]);

        return $dataProvider;
    }
    
    public function busquedadGeneral($params)
    {
        $query = Programa::find();

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
            'activo' => $this->activo,
        ]);

        $query->andFilterWhere(['like', 'nombre', $this->nombre]);
        
        $query->select([
            'p.id',
            'p.nombre',
            'count(r.id) as recurso_cantidad',
            'sum(r.monto) as monto',
            'count(distinct(r.personaid)) as persona_cantidad',
            '(SELECT sum(monto) FROM `recurso` WHERE (NOT (`fecha_acreditacion` IS NULL)) AND (`fecha_baja` IS NULL) and programaid=r.programaid) as monto_acreditado',
            '(SELECT sum(monto) FROM `recurso` WHERE (NOT (`fecha_baja` IS NULL)) and programaid=r.programaid) as monto_baja',
            '(SELECT count(id)  FROM `recurso` WHERE NOT (`fecha_baja` IS NULL) and programaid=r.programaid) as recurso_baja_cantidad',
            '(SELECT count(id)  FROM `recurso` WHERE (NOT (`fecha_acreditacion` IS NULL)) AND (`fecha_baja` IS NULL) and programaid=r.programaid) as recurso_acreditado_cantidad',
        ]);
        $query->from(['programa p']);
        $query->leftJoin('recurso as r', 'p.id=r.programaid');
        $query->groupBy(['p.nombre']);
        
        $coleccion_recurso = array();
        foreach ($dataProvider->models as $value) {
            $programa = $value->toArray();
            $programa['monto_acreditado'] = ($value['monto_acreditado']!=null)? doubleval($value['monto_acreditado']):0;
            $programa['monto_baja'] = ($value['monto_baja']!=null)? doubleval($value['monto_baja']):0;            
            $programa['monto_sin_acreditar'] = $value['monto']-$programa['monto_acreditado']-$programa['monto_baja']; 
            $programa['recurso_cantidad'] = $value['recurso_cantidad'];
            $programa['recurso_baja_cantidad'] = intval($value['recurso_baja_cantidad']);
            $programa['recurso_acreditado_cantidad'] = intval($value['recurso_acreditado_cantidad']);
            $programa['persona_cantidad'] = $value['persona_cantidad'];
            $programa['monto'] = ($value['monto']!=null)?$value['monto']:0;
            $coleccion_recurso[] = $programa;
        }
        
//        print_r($coleccion_recurso);die();
        return $coleccion_recurso;
    }
}