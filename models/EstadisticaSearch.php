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
}