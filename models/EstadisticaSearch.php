<?php

namespace app\models;

/**
* ProgramaSearch represents the model behind the search form about `app\models\Programa`.
*/
class EstadisticaSearch
{
    
    public function beneficiariosPorProgramaEnLocalidad($localidadid)
    {
        $query = new \yii\db\Query();
        
        $query->select([
            'p.id', 
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
}