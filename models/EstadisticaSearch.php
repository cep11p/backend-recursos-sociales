<?php

namespace app\models;

/**
* ProgramaSearch represents the model behind the search form about `app\models\Programa`.
*/
class EstadisticaSearch
{
    /**
     * Se obtienen la cantidad de beneficiarios clasificados por programas en una determinada localidad
     * @param int $localidadid
     * @return array
     */
    public function beneficiariosPorProgramaEnLocalidad($localidadid)
    {
        $query = new \yii\db\Query();
        
        $query->select([
            'r.localidadid', 
            'p.nombre', 
            'count(distinct(r.personaid)) as beneficiario_cantidad'
        ]);
        $query->from(['programa p']);
        $query->leftJoin('recurso as r', 'p.id=r.programaid');
        $query->where(['r.localidadid'=>$localidadid]);
        $query->groupBy(['p.nombre','r.localidadid']);
        
        $command = $query->createCommand();
        $rows = $command->queryAll();
        
        return $rows;
    }
    /**
     * Se obtienen la cantidad de beneficiarios clasificados por tipos de recurso(tipo de prestacion) en una determinada localidad
     * @param int $localidadid
     * @return array
     */
    public function beneficiariosPorTipoRecursoEnLocalidad($localidadid)
    {
        $query = new \yii\db\Query();
        
        $query->select([
            'r.localidadid', 
            't.nombre', 
            'count(distinct(r.personaid)) as beneficiario_cantidad'
        ]);
        $query->from(['recurso r']);
        $query->leftJoin('tipo_recurso as t', 't.id=r.tipo_recursoid');
        $query->where(['r.localidadid'=>$localidadid]);
        $query->groupBy(['t.nombre','r.localidadid']);
        
        $command = $query->createCommand();
        $rows = $command->queryAll();
        
        return $rows;
    }
    
    /**
     * Se obtiene montos (acreditado, sin acreditar y baja) clasificados por localidades
     * @return array
     */
    public function montosPorLocalidades($rango)
    {
        $rango = ($rango <2 || $rango>10)?10:$rango;
        $query = new \yii\db\Query();
        
        $query->select([
            'r.localidadid', 
            'count(r.id) as recurso_cantidad', 
            'sum(r.monto) as monto', 
            'count(distinct(r.personaid)) as beneficiario_cantidad', 
                '(SELECT sum(monto) FROM `recurso` WHERE (NOT (`fecha_acreditacion` IS NULL)) AND (`fecha_baja` IS NULL) and localidadid=r.localidadid) as monto_acreditado', 
		'(SELECT sum(monto) FROM `recurso` WHERE (NOT (`fecha_baja` IS NULL)) and localidadid=r.localidadid) as monto_baja', 
		'(SELECT count(id) FROM `recurso` WHERE NOT (`fecha_baja` IS NULL) and localidadid=r.localidadid) as recurso_baja_cantidad', 
		'(SELECT count(id) FROM `recurso` WHERE (NOT (`fecha_acreditacion` IS NULL)) AND (`fecha_baja` IS NULL) and localidadid=r.localidadid) as recurso_acreditado_cantidad'
        ]);
        $query->from(['recurso r']);
        $query->groupBy(['r.localidadid']);
        $query->orderBy(['monto'=> SORT_DESC]);
        $query->limit($rango);
        
        $command = $query->createCommand();
        $rows = $command->queryAll();
        
        $resultado = array();
        foreach ($rows as $value) {
            $localidad['localidadid'] = intval($value['localidadid']);
            $localidad['monto_acreditado'] = ($value['monto_acreditado']!=null)? doubleval($value['monto_acreditado']):0;
            $localidad['monto_baja'] = ($value['monto_baja']!=null)? doubleval($value['monto_baja']):0;            
            $localidad['monto_sin_acreditar'] = $value['monto']-$value['monto_acreditado']-$value['monto_baja']; 
            $localidad['recurso_cantidad'] = intval($value['recurso_cantidad']);
            $localidad['recurso_baja_cantidad'] = intval($value['recurso_baja_cantidad']);
            $localidad['recurso_acreditado_cantidad'] = intval($value['recurso_acreditado_cantidad']);
            $localidad['beneficiario_cantidad'] = intval($value['beneficiario_cantidad']);
            $localidad['monto'] = ($value['monto']!=null)?floatval($value['monto']):0;
            $resultado[] = $localidad;
        }
        
        if(count($resultado)>0){            
            #Se vinculan los nombre de la localidares correspondiente a cada prestacion
            $coleccion_localidad = $this->obtenerLocalidadVinculada($resultado);
            $resultado = $this->vincularLocalidad($resultado, $coleccion_localidad);
        }
        
        return $resultado;
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
}