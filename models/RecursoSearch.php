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
    public function sumarMontoAcreditado($params){
        $query = Recurso::find();
        $queryBase = $this->createQuery($params);
        
        $query->select([
                'monto_acreditado'=>'sum(monto)'
            ]);
        $query->Where([
                'not', ['fecha_acreditacion' => null]
            ]);
        
        $query->andWhere(['fecha_baja' => null]);
        
        if(count($queryBase->where)){
            $query->andWhere($queryBase->where);
        }
        
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
    public function sumarMontoBaja($params){
        $query = Recurso::find();
        $queryBase = $this->createQuery($params);
        
        $query->select([
                'monto_baja'=>'sum(monto)'
            ]);
        $query->where([
                'not', ['fecha_baja' => null]
            ]);
        
        if(count($queryBase->where)){
            $query->andWhere($queryBase->where);
        }
        
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
    public function sumarMontoSinAcreditar($params){
        $query = Recurso::find();
        $queryBase = $this->createQuery($params);
        
        $query->select([
                'monto_general'=>'sum(monto)'
            ]);
        if(count($queryBase->where)){
            $query->andWhere($queryBase->where);
        }
        
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
    public function contarRecursoAcreditado($params){
        $query = Recurso::find();
        $queryBase = $this->createQuery($params);
        
        $query->select([
                'recurso_acreditado_cantidad'=>'count(id)'
            ]);
        $query->where([
                'not', ['fecha_acreditacion' => null]
            ]);
        
        $query->andWhere(['fecha_baja' => null]);
        
        if(count($queryBase->where)){
            $query->andWhere($queryBase->where);
        }
        
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
    public function contarRecursoBaja($params){
        $query = Recurso::find();
        $queryBase = $this->createQuery($params);
        
        $query->select([
                'recurso_baja_cantidad'=>'count(id)'
            ]);
        $query->where([
                'not', ['fecha_baja' => null]
            ]);
        if(count($queryBase->where)){
            $query->andWhere($queryBase->where);
        }
        
        $command = $query->createCommand();
        $rows = $command->queryAll();
        
        $resultado = ($rows[0]['recurso_baja_cantidad']=='')?0:$rows[0]['recurso_baja_cantidad'];
                
        return intval($resultado);        
    }
    
    private function createQuery($params) {
        $query = Recurso::find();
        
//        $pagesize = (!isset($params['pagesize']) || !is_numeric($params['pagesize']) || $params['pagesize']==0)?20:intval($params['pagesize']);
//        $dataProvider = new ActiveDataProvider([
//            'query' => $query,
//            'pagination' => [
//                'pageSize' => $pagesize,
//                'page' => (isset($params['page']) && is_numeric($params['page']))?$params['page']:0
//            ],
//        ]);

        $this->load($params,'');
        
        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
             $query->where('0=1');
            return $query;
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
        
        
        #Criterio de recurso social por lista de persona.... lista de personaid
        if(count($lista_personaid)>0){
            $query->andWhere(array('in', 'personaid', $lista_personaid));
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
        if(isset($params['fecha_alta_desde']) && isset($params['fecha_alta_hasta'])){
            $query->andWhere(['between', 'fecha_alta', $params['fecha_alta_desde'], $params['fecha_alta_hasta']]);
        }else if(isset($params['fecha_alta_desde'])){
            $query->andWhere(['between', 'fecha_alta', $params['fecha_alta_desde'], date('Y-m-d')]);
        }else if(isset($params['fecha_alta_hasta'])){
            $query->andWhere(['between', 'fecha_alta', '1970-01-01', $params['fecha_alta_hasta']]);
        }
        
        #### Filtro por baja ####
        if(isset($params['baja']) && strtolower($params['baja'])=='true'){
            $query->andWhere(['not', ['fecha_baja' => null]]);
        }
        #### Filtro por acreditacion ####
        if(isset($params['acreditacion']) && strtolower($params['acreditacion'])=='true'){
            $query->andWhere(['not', ['fecha_acreditacion' => null]]);
            $query->andWhere(['fecha_baja' => null]);
        }
        
        
        #predeterminadamente vamos a ordenar por fecha_alta
        if(!isset($params['sort']) || empty($params['sort'])){
            $query->orderBy(['fecha_alta' => SORT_DESC]);
        }
        
        
        return $query;
    }

        /**
     * Se realiza un filtrado avanzado y general
     * @param array $params
     * @return ActiveDataProvider
     */
    public function busquedadGeneral($params)
    {
//        $query = Recurso::find();
        $query = $this->createQuery($params);
        $pagesize = (!isset($params['pagesize']) || !is_numeric($params['pagesize']) || $params['pagesize']==0)?20:intval($params['pagesize']);
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'pageSize' => $pagesize,
                'page' => (isset($params['page']) && is_numeric($params['page']))?$params['page']:0
            ],
        ]);
//
        $this->load($params,'');
        
        $monto_acreditado = $this->sumarMontoAcreditado($params);
        $monto_baja = $this->sumarMontoBaja($params);
        $monto_sin_acreditar = $this->sumarMontoSinAcreditar($params)-$monto_baja-$monto_acreditado;
        $recurso_acreditado_cantidad = $this->contarRecursoAcreditado($params);
        $recurso_baja_cantidad = $this->contarRecursoBaja($params);
        
        $coleccion_recurso = array();
        foreach ($dataProvider->getModels() as $value) {
            $coleccion_recurso[] = $value->toArray();
        }
        
        if(count($coleccion_recurso)>0){
            $coleccion_persona = $this->obtenerPersonaVinculada($coleccion_recurso);
            $coleccion_recurso = $this->vincularPersona($coleccion_recurso, $coleccion_persona);
        } 

        
        $paginas = ceil($dataProvider->totalCount/$pagesize);           
        $data['pagesize']=$pagesize;            
        $data['pages']=$paginas;            
        $data['total_filtrado']=$dataProvider->totalCount;
        $data['monto_acreditado']=(isset($monto_acreditado))?$monto_acreditado:0;
        $data['monto_baja']=(isset($monto_baja))?$monto_baja:0;
        $data['monto_sin_acreditar']=(isset($monto_sin_acreditar))?$monto_sin_acreditar:0;
        $data['recurso_acreditado_cantidad']=(isset($recurso_acreditado_cantidad))?$recurso_acreditado_cantidad:0;
        $data['recurso_baja_cantidad']=(isset($recurso_baja_cantidad))?$recurso_baja_cantidad:0;
        $data['resultado']=$coleccion_recurso;
        
        return $data;
    }
    
    /**
     * En este criterio los parametros de persona solo son relevantes al filtrado
     * @param type $params
     * @return type
     */
    private function crearSqlListaBeneficiario($params) {
        $query = Recurso::find();

        $this->load($params,'');

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
             $query->where('0=1');
            return $query;
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
        
        $query->select([
            'personaid',
            'count(monto) as recurso_cantidad',
            'sum(monto) as monto',
            '(SELECT sum(monto) FROM `recurso` WHERE (NOT (`fecha_acreditacion` IS NULL)) AND (`fecha_baja` IS NULL) and personaid=r1.personaid) as monto_acreditado',
            '(SELECT sum(monto) FROM `recurso` WHERE (NOT (`fecha_baja` IS NULL)) and personaid=r1.personaid) as monto_baja',
            '(SELECT count(id) AS `recurso_baja_cantidad` FROM `recurso` WHERE NOT (`fecha_baja` IS NULL) and personaid=r1.personaid) as recurso_baja_cantidad',
            '(SELECT count(id) AS `recurso_acreditado_cantidad` FROM `recurso` WHERE (NOT (`fecha_acreditacion` IS NULL)) AND (`fecha_baja` IS NULL) and personaid=r1.personaid) as recurso_acreditado_cantidad',
            ]);
        $query->from(['recurso r1']);
        $query->groupBy(['personaid']);
        
        #Ordenamos por recurso_cantidad(variable auxiliar)
        if(isset($params['sort']) && $params['sort']=='-recurso_cantidad'){
            $query->orderBy('recurso_cantidad desc');
        }
        if(isset($params['sort']) && $params['sort']=='recurso_cantidad'){
            $query->orderBy('recurso_cantidad asc');
        }
        
        return $query;
    }
    
    /**
     * Se lista una coleccion de beneficiarios
     * @param array $params
     * @return ActiveDataProvider
     */
    public function listaBeneficiarios($params)
    {
        $query = $this->crearSqlListaBeneficiario($params);
        $pagesize = (isset($params['pagesize']) && is_numeric($params['pagesize']))?$params['pagesize']:20;
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'pageSize' => $pagesize,
                'page' => (isset($params['page']) && is_numeric($params['page']))?$params['page']:0
            ],
        ]);
        
        $monto_acreditado = $this->sumarMontoAcreditado([]);
        $monto_baja = $this->sumarMontoBaja([]);
        $monto_sin_acreditar = $this->sumarMontoSinAcreditar([])-$monto_baja-$monto_acreditado;
        $recurso_acreditado_cantidad = $this->contarRecursoAcreditado([]);
        $recurso_baja_cantidad = $this->contarRecursoBaja([]);
        
        $coleccion_recurso = array();
        foreach ($dataProvider->models as $value) {
            $recurso = $value->toArray();
            $recurso['monto_acreditado'] = ($value['monto_acreditado']!=null)? doubleval($value['monto_acreditado']):0;
            $recurso['monto_baja'] = ($value['monto_baja']!=null)? doubleval($value['monto_baja']):0;            
            $recurso['monto_sin_acreditar'] = $value['monto']-$recurso['monto_acreditado']-$recurso['monto_baja'];   
            $recurso['recurso_cantidad'] = intval($value['recurso_cantidad']);
            $recurso['recurso_baja_cantidad'] = intval($value['recurso_baja_cantidad']);
            $recurso['recurso_acreditado_cantidad'] = intval($value['recurso_acreditado_cantidad']);
            $recurso['recurso_sin_acreditar_cantidad'] = $recurso['recurso_cantidad']-$recurso['recurso_baja_cantidad']-$recurso['recurso_acreditado_cantidad'];
            unset($recurso['programa']);
            unset($recurso['tipo_recurso']);
            $coleccion_recurso[] = $recurso;
        }
        
        if(count($coleccion_recurso)>0){
            $coleccion_persona = $this->obtenerPersonaVinculada($coleccion_recurso);
            $coleccion_recurso = $this->vincularPersona($coleccion_recurso, $coleccion_persona);
        } 
        
        $paginas = ceil($dataProvider->totalCount/$pagesize);
                         
        
        $data['pagesize']=$pagesize;            
        $data['pages']=$paginas;            
        $data['total_filtrado']=$dataProvider->totalCount;
        $data['monto_acreditado']=(isset($monto_acreditado))?$monto_acreditado:0;
        $data['monto_baja']=(isset($monto_baja))?$monto_baja:0;
        $data['monto_sin_acreditar']=(isset($monto_sin_acreditar))?$monto_sin_acreditar:0;
        $data['recurso_acreditado_cantidad']=(isset($recurso_acreditado_cantidad))?$recurso_acreditado_cantidad:0;
        $data['recurso_baja_cantidad']=(isset($recurso_baja_cantidad))?$recurso_baja_cantidad:0;
        $data['resultado']=$coleccion_recurso;
        
        return $data;
    }
    
    /**
     * Ademas de mostrar los datos de un beneficiario, se buscan todos las prestaciones de la misma y se ordenan por programa y fecha_alta Desc
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
        
        $query->select(['*']);
        $query->where(['personaid'=> $this->personaid]);
        $query->orderBy([
            'programaid'=>SORT_DESC,
            'fecha_alta'=>SORT_DESC
            ]);
        
        $personaForm = new PersonaForm();
        $resultado = $personaForm->obtenerPersonaConLugarYEstudios($this->personaid);
        if($dataProvider->getTotalCount()){
            $resultado['recurso_lista'] = array();
            foreach ($dataProvider->getModels() as $value) {
                $resultado['recurso_lista'][] = $value->toArray();
            }
           
            #Ser ordena la lista de recursos por programa y fecha_alta desc
            $programas = array();
            $coleccion_por_programa = array();
            $recurso_lista = array();
            for($i=0;$i<count($resultado['recurso_lista']);$i++){
                $existe=false;
                $programa_old = $resultado['recurso_lista'][$i]['programa'];
                foreach ($programas as $value) {
                    if($programa_old==$value['programa']){
                            $existe = true;
                    }
                }
                if(!$existe){
                    for($j=0;$j<count($resultado['recurso_lista']);$j++){
                        if($programa_old == $resultado['recurso_lista'][$j]['programa']){                        
                            $coleccion_por_programa[] = $resultado['recurso_lista'][$j];
                        }
                    }
                    $programas[] = array(                        
                        'programa'=>$programa_old,
                        'recurso_cantidad'=>count($coleccion_por_programa),
                        "recursos"=>$coleccion_por_programa
                    );
                    $coleccion_por_programa = array();
                }
            }            
            $recurso_lista[] = $programas;
            
            #Fin del ordenado
            $resultado['recurso_lista'] = $recurso_lista;
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