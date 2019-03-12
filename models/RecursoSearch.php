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
        [['fecha_inicial', 'fecha_alta', 'observacion', 'proposito','recurso_cantidad'], 'safe'],
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
    
    public function sumarMonto($params){
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
        
        $query->select(['monto_total'=>'sum(monto)']);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }
        
        ############ Buscamos por datos de persona ############
        #global search #global param
        $personaForm = new PersonaForm();
        if(isset($params['global_param']) && !empty($params['global_param'])){
            $persona_params["global_param"] = $params['global_param'];
        }
        
        if(isset($params['localidadid']) && !empty($params['localidadid'])){
            $persona_params['localidadid'] = $params['localidadid'];
        }
        
        if(isset($params['calle']) && !empty($params['calle'])){
            $persona_params['calle'] = $params['calle'];    
        }
        
        $coleccion_persona = array();
        $lista_personaid = array();
        if (isset($persona_params)) {
            
            $coleccion_persona = $personaForm->buscarPersonaEnRegistral($persona_params);
            $lista_personaid = $this->obtenerListaIds($coleccion_persona);

            if (count($lista_personaid) < 1) {
                $query->where('0=1');
            }
        }
        ############ Fin filtrado por Persona ############

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
        
        #### Filtro por rango de fecha ####
        if(isset($params['fecha_desde']) && isset($params['fecha_hasta'])){
            $query->andWhere(['between', 'fecha_alta', $params['fecha_desde'], $params['fecha_hasta']]);
        }else if(isset($params['fecha_desde'])){
            $query->andWhere(['between', 'fecha_alta', $params['fecha_desde'], date('Y-m-d')]);
        }else if(isset($params['fecha_hasta'])){
            $query->andWhere(['between', 'fecha_alta', '1970-01-01', $params['fecha_hasta']]);
        }
        
        #### Filtro por baja ####
//        if(isset($params['baja']) && $params['baja']==TRUE){
//            $query->andWhere(['fecha_baja'=>'NULL']);
//        }
        
        
        #Criterio de recurso social por lista de persona.... lista de personaid
        if(count($lista_personaid)>0){
            $query->andWhere(array('in', 'personaid', $lista_personaid));
        }
        
        $monto_total = ($query->one()->monto_total=='')?0:$query->one()->monto_total;
        $monto_total = ($monto_total!='')?$monto_total:0;
                
        return $monto_total;
        
    }


    public function busquedadGeneral($params)
    {
        $query = Recurso::find();
        
        $pagesize = (!isset($params['pagesize']) || !is_numeric($params['pagesize']) || $params['pagesize']==0)?20:intval($params['pagesize']);
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'pageSize' => $pagesize,
                'page' => (isset($params['page']) && is_numeric($params['page']))?$params['page']:0
            ],
        ]);

        $this->load($params,'');
        
        $monto_total = $this->sumarMonto($params);
        
        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }
        
        ############ Buscamos por datos de persona ############
        #global search #global param
        $personaForm = new PersonaForm();
        if(isset($params['global_param']) && !empty($params['global_param'])){
            $persona_params["global_param"] = $params['global_param'];
        }
        
        if(isset($params['localidadid']) && !empty($params['localidadid'])){
            $persona_params['localidadid'] = $params['localidadid'];
        }
        
        if(isset($params['calle']) && !empty($params['calle'])){
            $persona_params['calle'] = $params['calle'];    
        }
        
        $coleccion_persona = array();
        $lista_personaid = array();
        if (isset($persona_params)) {
            
            $coleccion_persona = $personaForm->buscarPersonaEnRegistral($persona_params);
            $lista_personaid = $this->obtenerListaIds($coleccion_persona);

            if (count($lista_personaid) < 1) {
                $query->where('0=1');
            }
        }
        ############ Fin filtrado por Persona ############

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
        
        #### Filtro por rango de fecha ####
        if(isset($params['fecha_desde']) && isset($params['fecha_hasta'])){
            $query->andWhere(['between', 'fecha_alta', $params['fecha_desde'], $params['fecha_hasta']]);
        }else if(isset($params['fecha_desde'])){
            $query->andWhere(['between', 'fecha_alta', $params['fecha_desde'], date('Y-m-d')]);
        }else if(isset($params['fecha_hasta'])){
            $query->andWhere(['between', 'fecha_alta', '1970-01-01', $params['fecha_hasta']]);
        }
        
        #### Filtro por baja ####
        if(isset($params['baja']) && strtolower($params['baja'])=='true'){
            $query->andWhere(['not', ['fecha_baja' => null]]);
        }
        #### Filtro por acreditacion ####
        if(isset($params['acreditacion']) && strtolower($params['acreditacion'])=='true'){
            $query->andWhere(['not', ['fecha_acreditacion' => null]]);
        }
        
        #Criterio de recurso social por lista de persona.... lista de personaid
        if(count($lista_personaid)>0){
            $query->andWhere(array('in', 'personaid', $lista_personaid));
        }
        
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
        $data['monto_total']=(isset($monto_total))?$monto_total:0;
        $data['resultado']=$coleccion_recurso;
        
        return $data;
    }
    
    public function listaRecursosAgrupadosPorPersona($params)
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
        
        ############ Buscamos por datos de persona(PENDIENTE para modularizar) ###################
        #global search #global param
        $personaForm = new PersonaForm();
        if(isset($params['global_param']) && !empty($params['global_param'])){
            $persona_params["global_param"] = $params['global_param'];
        }
        
        if(isset($params['localidadid']) && !empty($params['localidadid'])){
            $persona_params['localidadid'] = $params['localidadid'];
        }
        
        if(isset($params['calle']) && !empty($params['calle'])){
            $persona_params['calle'] = $params['calle'];    
        }
        
        $coleccion_persona = array();
        $lista_personaid = array();
        if (isset($persona_params)) {
            
            $coleccion_persona = $personaForm->buscarPersonaEnRegistral($persona_params);
            $lista_personaid = $this->obtenerListaIds($coleccion_persona);

            if (count($lista_personaid) < 1) {
                $query->where('0=1');
            }
        }
        
        #Criterio de recurso social por lista de persona.... lista de personaid
        if(count($lista_personaid)>0){
            $query->andWhere(array('in', 'personaid', $lista_personaid));
        }
        ############# FIN DEl CRITERIO DE PERSONA ############
        
        $query->select(['count(monto) as recurso_cantidad','sum(monto) as monto','personaid']);
        $query->from(['recurso']);
        $query->groupBy(['personaid']);
        
        #Ordenamos por recurso_cantidad(variable auxiliar)
        if(isset($params['sort']) && $params['sort']=='-recurso_cantidad'){
            $query->orderBy('recurso_cantidad desc');
        }
        if(isset($params['sort']) && $params['sort']=='recurso_cantidad'){
            $query->orderBy('recurso_cantidad asc');
        }
        
        
        $coleccion_recurso = array();
        foreach ($dataProvider->models as $value) {
            $recurso = $value->toArray();
            $recurso['recurso_cantidad'] = $value['recurso_cantidad'];
            unset($recurso['programa']);
            unset($recurso['tipo_recurso']);
            $coleccion_recurso[] = $recurso;
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
    
    /**
     * Ademas de mostrar los datos de un beneficiario, se buscan todos las prestaciones de misma y se agrupan por programa
     * @param array $param
     * @return ActiveDataProvider|array
     */
    public function viewBeneficiario($param)
    {
        $query = Recurso::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($param,'');

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }
        
        $sql = 'SELECT * FROM recurso WHERE personaid = '.$this->personaid;
        $query->sql = $sql;
        
        $personaForm = new PersonaForm();
        $resultado = $personaForm->obtenerPersonaConLugarYEstudios($this->personaid);
        if($dataProvider->getTotalCount()){
            $resultado['recurso_lista'] = array();
            foreach ($dataProvider->getModels() as $value) {
                $resultado['recurso_lista'][] = $value->toArray();
            }
           
            $programas = array();
            foreach ($resultado['recurso_lista'] as $recurso) {
                $programa_old = $recurso['programaid'];
                $programa_nombre = strtolower(str_replace(" ", "_", \app\components\Help::quitar_tildes($recurso['programa'])));
                
                foreach ($recurso as $k => $value) {
                    if($k == 'programaid'){
                        if($programa_old == $value){
                            $programas[$programa_nombre][] = $recurso;
                        }
                    }
                }
            }
            
            $resultado['recurso_lista'] = $programas;
        }       
        
        return $resultado;
    }

    /**
     * De una coleccion de persona, se obtienen una lista de ids
     * @param array $coleccion lista de personas
     * @return array
     */
    private function obtenerListaIds($coleccion = array()) {
        
        $lista_ids = array();
        foreach ($coleccion as $col) {
            $lista_ids[] = $col['id'];
        }
        
        return $lista_ids;    
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