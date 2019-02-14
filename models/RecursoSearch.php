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
        
        $pagesize = (isset($params['pagesize']) && is_numeric($params['pagesize']))?$params['pagesize']:20;
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'pageSize' => $pagesize,
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
        
        $coleccion_recurso = array();
        foreach ($dataProvider->getModels() as $value) {
            $coleccion_recurso[] = $value->toArray();
        }
        
        if(count($coleccion_recurso)>0){
            $coleccion_persona = $this->obtenerPersonaVinculada($coleccion_recurso);
            $coleccion_recurso = $this->vincularPersona($coleccion_recurso, $coleccion_persona);
        } 

        
        $paginas = ceil($dataProvider->totalCount/$pagesize);
                    
        $data['success']=(count($coleccion_recurso)>0)?true:false;           
        $data['pagesize']=$pagesize;            
        $data['pages']=$paginas;            
        $data['total_filtrado']=$dataProvider->totalCount;
        $data['resultado']=$coleccion_recurso;
        
        return $data;
    }
    
    public function listaBeneficiario($params)
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
        
        $sql = 'SELECT sum(monto) as monto, personaid FROM recurso group by personaid';
        $query->sql = $sql;

        return $dataProvider;
    }
    
    /**
     * Se vinculan las personas a los recursos
     * @param type $coleccion_recurso
     * @param type $coleccion_personaid
     * @return array
     */
    private function vincularPersona($coleccion_recurso = array(), $coleccion_personaid = array()) {
        $i=0;
        foreach ($coleccion_recurso as $recurso) {
            foreach ($coleccion_personaid as $persona) {
                if(isset($recurso['personaid']) && isset($persona['id']) && $recurso['personaid']==$persona['id']){                    
                    $recurso['persona'] = $persona;
                    $coleccion_recurso[$i] = $recurso;
                }
            }
            $i++;
        }
        
        return $coleccion_recurso;
    }
    
    /**
     * Se obtienen las personas que están vinculadas a la lista de recursos
     * @param array $coleccion_recursos
     * @return array
     */
    private function obtenerPersonaVinculada($coleccion_recursos = array()) {
        $personaForm = new PersonaForm();
        $ids='';
        foreach ($coleccion_recursos as $recursos) {
            $ids .= (empty($ids))?$recursos['personaid']:','.$recursos['personaid'];
        }
        
        $coleccionPersona = $personaForm->buscarPersonaEnRegistral(array("ids"=>$ids));
        
        return $coleccionPersona;
    }

}