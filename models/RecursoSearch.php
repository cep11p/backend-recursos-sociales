<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Recurso;
use app\rbac\PermisoPrograma;
use yii\db\Query;

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
            [['id', 'programaid', 'tipo_recursoid', 'personaid','localidadid'], 'integer'],
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
        $query = new Query();
        
        $query->select([
                'monto_acreditado'=>'sum(c.monto)'
            ]);
        $query->from('cuota c');
        $query->leftJoin('recurso r','r.id=c.recursoid');

        #### Filtro por rango de fecha ####
        if(isset($params['fecha_alta_desde']) && isset($params['fecha_alta_hasta'])){
            $query->andWhere(['between', 'c.fecha_pago', $params['fecha_alta_desde'], $params['fecha_alta_hasta']]);
        }else if(isset($params['fecha_alta_desde'])){
            $query->andWhere(['between', 'c.fecha_pago', $params['fecha_alta_desde'], date('Y-m-d')]);
        }else if(isset($params['fecha_alta_hasta'])){
            $query->andWhere(['between', 'c.fecha_pago', '1970-01-01', $params['fecha_alta_hasta']]);
        }else if(!isset($params['fecha_alta_desde']) && !isset($params['fecha_alta_hasta'])){
            if(isset($params['mes']) && !empty($params['mes'])){
                $params['fecha_alta_hasta'] = date('Y').'-'.$params['mes'].'-01';
            }else{
                $params['fecha_alta_hasta'] = date('Y').'-06-01';
            }
            $params['fecha_alta_desde'] = date('Y-m-d',strtotime($params['fecha_alta_hasta'].' -1 year'));

            $query->andWhere(['between', 'c.fecha_pago', $params['fecha_alta_desde'], $params['fecha_alta_hasta']]);
        }

        ##Chequeamos el estado
        switch ($params['estado']) {
            case 'baja':
                $query->andWhere(['not', ['r.fecha_baja' => null]]);
                break;
            case 'acreditado':                
                break;
            case 'sin-acreditar':
                break;
            default :     
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
        $query = $this->createQuery($params);
        
        $query->select([
                'monto_baja'=>'sum(monto)'
            ]);
        $query->andwhere([
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
    public function sumarMontoSinAcreditar($params = array()){
        $query = $this->createQuery($params);
        
        $query->select([
                'monto_general'=>'sum(recurso.monto)'
            ]);
        
        $command = $query->createCommand();
        $rows = $command->queryAll();
        
        ##Chequeamos el estado
        switch ($params['estado']) {
            case 'baja':
                $monto_general = 0;
                break;
            case 'acreditado':                
                $monto_general = 0;
                break;
            case 'sin-acreditar':
                break;
            default :     
        }
        
        // print_r($command->sql);die();
        $resultado = doubleval(($rows[0]['monto_general']=='')?0:$rows[0]['monto_general']) - $this->sumarMontoAcreditado($params);
        
        return (isset($monto_general))?0:$resultado;       

    }
    
    /**
     * Contamos la cantidad de recursos acreditados
     * @param array $params criterio de filtrado
     * @return int
     */
    public function contarRecursoAcreditado($params){
        $query = $this->createQuery($params);
        
        $query->select([
                'recurso_acreditado_cantidad'=>'count(recurso.id)'
            ]);
        $query->andWhere([
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
    public function contarRecursoBaja($params){
        $query = $this->createQuery($params);
        
        $query->select([
                'recurso_baja_cantidad'=>'count(recurso.id)'
            ]);
        $query->andWhere([
                'not', ['fecha_baja' => null]
            ]);
        
        $command = $query->createCommand();
        $rows = $command->queryAll();
        
        $resultado = ($rows[0]['recurso_baja_cantidad']=='')?0:$rows[0]['recurso_baja_cantidad'];
                
        return intval($resultado);        
    }
    
    private function createQuery($params) {
        $query = Recurso::find();

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
        
        if(isset($params['persona']['localidadid']) && !empty($params['persona']['localidadid'])){
            $persona_params['localidadid'] = $params['persona']['localidadid'];    
        }
        
        if(isset($params['persona']['direccion']) && !empty($params['persona']['direccion'])){
            $persona_params['direccion'] = $params['persona']['direccion'];    
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

        #Seteamos la condicion adecuada segun los permisos del usuario (Rbac + Rule)
        $query->andWhere(PermisoPrograma::setCondicionPermisoProgramaVer());
        
        #Criterio de recurso social por lista de persona.... lista de personaid
        if(count($lista_personaid)>0){
            $query->andWhere(array('in', 'personaid', $lista_personaid));
        }
        ############ Fin filtrado por Persona ############

        if(isset($this->tipo_responsableid)){
            $query->leftJoin("responsable as r", "responsable_entregaid=r.id");
            
            $query->andFilterWhere(['r.tipo_responsableid' => $this->tipo_responsableid]);
        }
        
        $query->andFilterWhere([
            'id' => $this->id,
            'fecha_inicial' => $this->fecha_inicial,
            'fecha_alta' => $this->fecha_alta,
            'recurso.monto' => $this->monto,
            'programaid' => $this->programaid,
            'tipo_recursoid' => $this->tipo_recursoid,
            'personaid' => $this->personaid,
            'localidadid' => $this->localidadid,
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
        }else if(!isset($params['fecha_alta_desde']) && !isset($params['fecha_alta_hasta'])){
            if(isset($params['mes']) && !empty($params['mes'])){
                $params['fecha_alta_hasta'] = date('Y').'-'.$params['mes'].'-01';
            }else{
                $params['fecha_alta_hasta'] = date('Y').'-06-01';
            }
            $params['fecha_alta_desde'] = date('Y-m-d',strtotime($params['fecha_alta_hasta'].' -1 year'));

            $query->andWhere(['between', 'fecha_alta', $params['fecha_alta_desde'], $params['fecha_alta_hasta']]);
        }

        
         #### Filtro por estado ####
        switch ($params['estado']) {
            case 'baja':
                $query->andWhere(['not', ['fecha_baja' => null]]);
                break;
            case 'acreditado':                
                $query->andWhere(['not', ['fecha_acreditacion' => null]]);
                $query->andWhere(['fecha_baja' => null]);
                break;
            case 'sin-acreditar':
                $query->andWhere(['fecha_acreditacion' => null]);
                $query->andWhere(['fecha_baja' => null]);
                
                #Filtramos por pagos de cuotas #Cuota #Mes
                if(isset($params['mes']) && !empty($params['mes'])){
                    $param_fecha = date('Y',strtotime($params['fecha_alta_hasta'])).'-'.$params['mes'].'-01';

                    $condicion = "(
                        ((SELECT count(c.fecha_pago) FROM cuota c WHERE c.recursoid = recurso.id LIMIT 1) = 0 and not (EXTRACT(YEAR_MONTH FROM recurso.fecha_alta ) > EXTRACT(YEAR_MONTH FROM '$param_fecha'))) -- Condicion busca prestaciones sin ningun pago
                         or
                        (EXTRACT( YEAR_MONTH FROM(SELECT c.fecha_pago FROM cuota c WHERE c.recursoid = recurso.id ORDER BY fecha_pago desc LIMIT 1)) <=  EXTRACT( YEAR_MONTH FROM DATE_SUB('$param_fecha', INTERVAL 1 MONTH) ) -- Condicion busca prestaciones con ultimo pago
                            and
                            EXTRACT( YEAR_MONTH FROM recurso.fecha_alta ) < EXTRACT( YEAR_MONTH FROM  '$param_fecha')) 
                   )";
                    $query->andWhere($condicion);
                }
                break;
            default :      
                break;
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
        $query = $this->createQuery($params);
        $pagesize = (!isset($params['pagesize']) || !is_numeric($params['pagesize']) || $params['pagesize']==0)?20:intval($params['pagesize']);
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'pageSize' => $pagesize,
                'page' => (isset($params['page']) && is_numeric($params['page']))?$params['page']:0
            ],
        ]);
        $this->load($params,'');
        
        
        $coleccion_recurso = array();
        foreach ($dataProvider->getModels() as $value) {
            $coleccion_recurso[] = $value->toArray();
        }

        $monto_acreditado = $this->sumarMontoAcreditado($params);
        $monto_sin_acreditar = $this->sumarMontoSinAcreditar($params);
        
        /*** Se obtiene datos de otros sistemas ***/
        if(count($coleccion_recurso)>0){
            #Se vinculan los datos de las personas correspondiente a cada prestacion
            $coleccion_persona = $this->obtenerPersonaVinculada($coleccion_recurso);
            $coleccion_recurso = $this->vincularPersona($coleccion_recurso, $coleccion_persona);
            
            #Vamos a obtener coleccion de ids que hacen referencia a el sistema Lugar
            $coleccion_recurso = \app\components\VinculoInteroperableHelp::obtenerYVincularParametrosDeLugar($coleccion_recurso);
            
        } 

        
        $paginas = ceil($dataProvider->totalCount/$pagesize);           
        $data['pagesize']=$pagesize;            
        $data['pages']=$paginas;            
        $data['total_filtrado']=$dataProvider->totalCount;
        $data['monto_acreditado']=(isset($monto_acreditado))?$monto_acreditado:0;
        $data['monto_sin_acreditar']=(isset($monto_sin_acreditar))?$monto_sin_acreditar:0;
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

        #Obtenemos la lista de programaid de un usuario
        $programa_ids = '';
        foreach (PermisoPrograma::setCondicionPermisoProgramaVer() as $mix) {
            foreach ($mix as  $value) {
                $programa_ids .= (empty($programa_ids))?$value:','.$value;
            }
        }

        
        $query->select([
            'personaid',
            'count(monto) as recurso_cantidad',
            'sum(monto) as monto',
            '(SELECT sum(c2.monto) FROM `cuota` as c2 LEFT JOIN recurso r2 on c2.recursoid = r2.id WHERE r1.personaid=r2.personaid and r2.programaid in ('.$programa_ids.')) as monto_acreditado',
            '(SELECT sum(monto) FROM `recurso` WHERE (NOT (`fecha_baja` IS NULL)) and personaid=r1.personaid and programaid in ('.$programa_ids.')) as monto_baja',
            '(SELECT count(id) AS `recurso_baja_cantidad` FROM `recurso` WHERE NOT (`fecha_baja` IS NULL) and personaid=r1.personaid and programaid in ('.$programa_ids.')) as recurso_baja_cantidad',
            '(SELECT count(id) AS `recurso_acreditado_cantidad` FROM `recurso` WHERE (NOT (`fecha_acreditacion` IS NULL)) AND (`fecha_baja` IS NULL) and personaid=r1.personaid and programaid in ('.$programa_ids.')) as recurso_acreditado_cantidad',
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

        #Seteamos la condicion adecuada segun los permisos del usuario (Rbac + Rule)
        $query->andWhere(PermisoPrograma::setCondicionPermisoProgramaVer('r1'));


        // print_r($query->createCommand()->queryAll());die();
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
        $monto_sin_acreditar = $this->sumarMontoSinAcreditar()-$monto_baja;
        $recurso_acreditado_cantidad = $this->contarRecursoAcreditado([]);
        $recurso_baja_cantidad = $this->contarRecursoBaja([]);
        
        $rows = $query->createCommand()->queryAll();
        $coleccion_recurso = array();
        foreach ($rows as $value) {
            $value['monto_acreditado'] = ($value['monto_acreditado']!=null)? doubleval($value['monto_acreditado']):0;
            $value['monto_baja'] = ($value['monto_baja']!=null)? doubleval($value['monto_baja']):0;            
            $value['monto_sin_acreditar'] = $value['monto']-$value['monto_acreditado']-$value['monto_baja'];   
            $value['recurso_cantidad'] = intval($value['recurso_cantidad']);
            $value['recurso_baja_cantidad'] = intval($value['recurso_baja_cantidad']);
            $value['recurso_acreditado_cantidad'] = intval($value['recurso_acreditado_cantidad']);
            $value['recurso_sin_acreditar_cantidad'] = $value['recurso_cantidad']-$value['recurso_baja_cantidad']-$value['recurso_acreditado_cantidad'];
            $coleccion_recurso[] = $value;
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
        
        #Seteamos la condicion adecuada segun los permisos del usuario (Rbac + Rule)
        $query->andWhere(PermisoPrograma::setCondicionPermisoProgramaVer());

        #### preparamos los datos del beneficiario para mostrar ####
        $personaForm = new PersonaForm();
        $resultado = $personaForm->obtenerPersonaConLugarYEstudios($this->personaid);
        
        #### Obtenemos la lista de recursos que tiene el beneficiario ####
        if($dataProvider->getTotalCount()){
            $resultado['recurso_lista'] = array();
            foreach ($dataProvider->getModels() as $value) {
                $pretacion = $value->toArray();
                
                #### Si la prestacion tiene alumnos, agregramos una lista de alumnos ####
                if(count($value->alumnos)>0){
                    $pretacion = \yii\helpers\ArrayHelper::merge($pretacion,array("alumno_lista"=>$value->alumnos));
                }
                
                #### Preparamos la prestacion para mostrar ####
                $resultado['recurso_lista'][] = $pretacion;
            }
           
            #Se ordena y se agrupa la lista de recursos por programa y fecha_alta desc
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
                #### Se crea listado de prestaciones en programa_grupo ####
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
            $recurso_lista = $programas;
            
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
        $pagesize = count($coleccion_recursos); 
        foreach ($coleccion_recursos as $recursos) {
            $ids .= (empty($ids))?$recursos['personaid']:','.$recursos['personaid'];
        }
        
        $coleccionPersona = $personaForm->buscarPersonaEnRegistral(array("ids"=>$ids,"pagesize"=>$pagesize));
        
        return $coleccionPersona;
    }
    
    /**
     * Se vinculan las localidades a la lista de recursos
     * @param array $coleccion_recurso
     * @param array $coleccion_localidadid
     * @return array
     */
    private function vincularLocalidad($coleccion_recurso = array(), $coleccion_localidadid = array()) {
        $i=0;
        foreach ($coleccion_recurso as $recurso) {
            foreach ($coleccion_localidadid as $localidad) {
                if(isset($recurso['localidadid']) && isset($localidad['id']) && $recurso['localidadid']==$localidad['id']){                    
                    $recurso['localidad'] = $localidad['nombre'];
                    $coleccion_recurso[$i] = $recurso;
                }
            }
            $i++;
        }
        
        return $coleccion_recurso;
    }
    
    /**
     * Se obtienen las localidades que están vinculadas a la lista de recursos (localidadid)
     * @param array $coleccion_recursos
     * @return array
     */
    private function obtenerLocalidadVinculada($coleccion_recursos = array()) {
        $lugarForm = new LugarForm();
        $ids='';
        $pagesize = count($coleccion_recursos); 
        foreach ($coleccion_recursos as $recursos) {
            #si esta seteada la localidad
            if(isset($recursos['localidadid'])){
                $ids .= (empty($ids))?$recursos['localidadid']:','.$recursos['localidadid'];
            }
            
        }
        
        $coleccion = $lugarForm->buscarLocalidadEnSistemaLugar(array("ids"=>$ids,"pagesize"=>$pagesize));
        
        return $coleccion;
    }
    
    /**
     * Se obtienen los reponsables mediante interoperabilidad con lugar y se vincula a la prestacion correspondiente.
     * Esta funcion abarca estos 3 tipos de responsables: Delegacion, Municipio y Comision de fomento
     * @param array $coleccion_recursos
     * @return array
     */
    private function asociarResponsablesPorInteroperabilidad($coleccion_recursos = array()) {
        $lugarForm = new LugarForm();
        $pagesize = count($coleccion_recursos);
        
        $coleccion_delegacion = array();
        $coleccion_comision_fomento = array();
        $coleccion_municipio = array();

        /** array con coleccions de ids para solicitar colección **/
        $coleccion_municipio_ids = array();
        $coleccion_comision_fomento_ids = array();
        $coleccion_delegacion_ids = array();
        
        /** Buscamos si un recurso(prestacion) tiene resonsable, si tiene responsable es importante saber el tipo de reposable */
        foreach ($coleccion_recursos as $recurso) {            
            //vamos a chequear cuantas prestaciones fueron entregadas por Delegaciones
            if(isset($recurso['responsable_entrega']['tipo_responsableid']) && ($recurso['responsable_entrega']['tipo_responsableid'] == $this::TIPO_RESPONSABLE_DELEGACION)){
                #chequeamos el tipo de ids responsable
                if(!in_array($recurso['responsable_entrega']['responsableid'], $coleccion_delegacion_ids)){
                    $coleccion_delegacion_ids[] = $recurso['responsable_entrega']['responsable_entregaid'];
                }
            }
            
            ////vamos a chequear cuantas prestaciones fuerona entregadas por comisiones de fomento
            if(isset($recurso['responsable_entrega']['tipo_responsableid']) && ($recurso['responsable_entrega']['tipo_responsableid'] == $this::TIPO_RESPONSABLE_MUNICIPIO)){
                #obtenemos la lista de ids comisiones de fomento
                if(!in_array($recurso['responsable_entrega']['responsableid'], $coleccion_comision_fomento_ids)){
                    $coleccion_comision_fomento_ids[] = $recurso['responsable_entrega']['responsable_entregaid'];
                }
            }
            
            //vamos a chequear cuantas prestaciones fueron entregadas por Municipios
            if(isset($recurso['responsable_entrega']['tipo_responsableid']) && ($recurso['responsable_entrega']['tipo_responsableid'] == $this::TIPO_RESPONSABLE_COMISION_FOMENTO)){
                #obtenemos la lista de ids comisiones de fomento
                if(!in_array($recurso['responsable_entrega']['responsableid'], $coleccion_municipio_ids)){
                    $coleccion_municipio[] = $recurso['responsable_entrega']['responsable_entregaid'];
                }
            }
        }
        
        /** Obtenemos las delegaciones relevantes a un entrega de prestacions **/
        if(count($coleccion_delegacion_ids)>0){
            //obtenemos la coleccion de las delegaciones
            $delegacion_ids = '';
            foreach ($coleccion_delegacion_ids as $id) {
                    $delegacion_ids .= (empty($delegacion_ids))?$id:','.$id;
            }
            //vamos a mapear todas la delegaciones
            $coleccion_delegacion = $lugarForm->buscarDelegacionEnSistemaLugar(array("ids"=>$delegacion_ids,"pagesize"=>$pagesize));
        }
        
        /** Obtenemos las comisiones de fomentos relevantes a un entrega de prestacions **/
        if(count($coleccion_comision_fomento_ids)){
            //obtenemos la coleccion de las comisiones de fomento
            $comision_fomento_ids = '';
            foreach ($coleccion_comision_fomento_ids as $id) {
                    $comision_fomento_ids .= (empty($comision_fomento_ids))?$id:','.$id;
            }
            //vamos a mapear todas la delegaciones
            $coleccion_comision_fomento = $lugarForm->buscarDelegacionEnSistemaLugar(array("ids"=>$comision_fomento_ids,"pagesize"=>$pagesize));
        }
        
        /** Obtenemos los municipios relevantes a un entrega de prestacions **/
        if(count($coleccion_municipio_ids)){
            //obtenemos la coleccion de las comisiones de fomento
            $municipio_ids = '';
            foreach ($coleccion_municipio as $id) {
                    $municipio_ids .= (empty($municipio_ids))?$id:','.$id;
            }
            //vamos a mapear todas la delegaciones
            $coleccion_municipio = $lugarForm->buscarDelegacionEnSistemaLugar(array("ids"=>$coleccion_municipio_ids,"pagesize"=>$pagesize));
        }
        
        
        
        //vinculamos los responsables de entrega a a la coleccion de recursos(Prestaciónes)
        $i=0;
        foreach ($coleccion_recursos as $recurso){
            
            //Vinculamos las delegaciones
            foreach ($coleccion_delegacion as $delegacion) {
                //buscamos al recurso que tenga ese tipo de responsable y el responsable
                if(isset($recurso['responsable_entrega']['responsable_entregaid']) && ($recurso['responsable_entrega']['responsable_entregaid'] == $delegacion['id'])){
                    $recurso['responsable_entrega']=$delegacion['nombre'].' (Delegacion)';
                    $recurso['tipo_responsable']='Delegación';
                    $coleccion_recursos[$i]=$recurso;
                }
            }
            //Vinculamos las comisiones de fomentos
            foreach ($coleccion_comision_fomento as $comision_fomento) {
                //buscamos al recurso que tenga ese tipo de responsable y el responsable
                if(isset($recurso['responsable_entrega']['responsable_entregaid']) && ($recurso['responsable_entrega']['responsable_entregaid'] == $comision_fomento['id'])){
                    $recurso['responsable_entrega']=$comision_fomento['nombre'].' (Comision de Fomento)';
                    $recurso['tipo_responsable']='Comision de Fomento';
                    $coleccion_recursos[$i]=$recurso;
                }
            }  
            //Vinculamos los municipios
            foreach ($coleccion_municipio as $municipio) {
                //buscamos al recurso que tenga ese tipo de responsable y el responsable
                if(isset($recurso['responsable_entrega']['responsable_entregaid']) && ($recurso['responsable_entrega']['responsable_entregaid'] == $municipio['id'])){
                    $recurso['responsable_entrega']=$municipio['nombre'].' (Municipio)';
                    $recurso['tipo_responsable']='Municipio';
                    $coleccion_recursos[$i]=$recurso;
                }
            }              
            $i++;
        }
        
        return $coleccion_recursos;
    }
    
    public function obtenerParametrosLugar() {
        $response = \Yii::$app->lugar->obtenerParametro([]);  
        return $response;
    }

}