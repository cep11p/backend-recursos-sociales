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
    
    /**
     * Sumamos el monto acreditado general
     * @param array $params criterio de filtrado
     * @return double
     */
    public function sumarMontoAcreditado(){
        $query = Recurso::find();
        
        $query->select([
                'monto_acreditado'=>'sum(monto)'
            ]);
        $query->where([
                'not', ['fecha_acreditacion' => null]
            ]);
        
        $query->andWhere(['fecha_baja' => null]);
        
        $command = $query->createCommand();
        $rows = $command->queryAll();
        
        $resultado = ($rows[0]['monto_acreditado']=='')?0:$rows[0]['monto_acreditado'];
                
        return doubleval($resultado);       
    }
    
    /**
     * Sumamos el monto baja general
     * @param array $params criterio de filtrado
     * @return double
     */
    public function sumarMontoBaja(){
        $query = Recurso::find();
        
        $query->select([
                'monto_baja'=>'sum(monto)'
            ]);
        $query->where([
                'not', ['fecha_baja' => null]
            ]);
        
        $command = $query->createCommand();
        $rows = $command->queryAll();
        
        $resultado = ($rows[0]['monto_baja']=='')?0:$rows[0]['monto_baja'];
                
        return doubleval($resultado);        
    }
    
    /**
     * Sumamos el monto general (suma de recursos que no estan acreditados ni dados de baja)
     * @param array $params criterio de filtrado
     * @return double
     */
    public function sumarMontoGeneral(){
        $query = Recurso::find();
        
        $query->select([
                'monto_general'=>'sum(monto)'
            ]);
        
        $command = $query->createCommand();
        $rows = $command->queryAll();
        
        $resultado = ($rows[0]['monto_general']=='')?0:$rows[0]['monto_general'];
                
        return doubleval($resultado);        
    }
    
    /**
     * Contamos la cantidad de recursos acreditados
     * @param array $params criterio de filtrado
     * @return int
     */
    public function contarRecursoAcreditado(){
        $query = Recurso::find();
        
        $query->select([
                'recurso_acreditado_cantidad'=>'count(id)'
            ]);
        $query->where([
                'not', ['fecha_acreditacion' => null]
            ]);
        
        $query->andWhere(['fecha_baja' => null]);
        
        $command = $query->createCommand();
        $rows = $command->queryAll();
        
        $resultado = ($rows[0]['recurso_acreditado_cantidad']=='')?0:$rows[0]['recurso_acreditado_cantidad'];
                
        return intval($resultado);        
    }
    
    /**
     * Contamos la cantidad de recursos baja
     * @param array $params criterio de filtrado
     * @return int
     */
    public function contarRecursoBaja(){
        $query = Recurso::find();       
        
        $query->select([
                'recurso_baja_cantidad'=>'count(id)'
            ]);
        $query->where([
                'not', ['fecha_baja' => null]
            ]);
        
        $command = $query->createCommand();
        $rows = $command->queryAll();
        
        $resultado = ($rows[0]['recurso_baja_cantidad']=='')?0:$rows[0]['recurso_baja_cantidad'];
                
        return intval($resultado);        
    }


    /**
     * Se realiza un filtrado avanzado y general
     * @param array $params
     * @return ActiveDataProvider
     */
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
        
        $monto_acreditado = $this->sumarMontoAcreditado();
        $monto_baja = $this->sumarMontoBaja();
        $monto_general = $this->sumarMontoGeneral()-$monto_baja-$monto_acreditado;
        $recurso_acreditado_cantidad = $this->contarRecursoAcreditado();
        $recurso_baja_cantidad = $this->contarRecursoBaja();
        
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
        
        #predeterminadamente vamos a ordenar por fecha_alta
        if(!isset($params['sort']) || empty($params['sort'])){
            $query->orderBy(['fecha_alta' => SORT_DESC]);
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
        $data['monto_acreditado']=(isset($monto_acreditado))?$monto_acreditado:0;
        $data['monto_baja']=(isset($monto_baja))?$monto_baja:0;
        $data['monto_general']=(isset($monto_general))?$monto_general:0;
        $data['recurso_acreditado_cantidad']=(isset($recurso_acreditado_cantidad))?$recurso_acreditado_cantidad:0;
        $data['recurso_baja_cantidad']=(isset($recurso_baja_cantidad))?$recurso_baja_cantidad:0;
        $data['resultado']=$coleccion_recurso;
        
        return $data;
    }
    
    /**
     * Se lista una coleccion de beneficiarios
     * @param array $params
     * @return ActiveDataProvider
     */
    public function listaBeneficiarios($params)
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
                    unset($recurso['baja']);
                    unset($recurso['acreditacion']);
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