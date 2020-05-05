<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\components;
use yii\helpers\ArrayHelper;
use app\models\LugarForm;

class VinculoInteroperableHelp extends \yii\base\Component{
    
    /**
     * Se vinculan las personas a los recursos
     * @param type $coleccion_recurso
     * @param type $coleccion_personaid
     * @return array
     */
    public function vincularPersona($coleccion_recurso = array(), $coleccion_personaid = array()) {
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
    public function obtenerPersonaVinculada($coleccion_recursos = array()) {
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
     * Se vinculan los nombres de la localidades a una coleccion que tenga localidadid
     * @param array $coleccion
     * @param array $coleccion_localidad
     * @return array
     */
    static function vincularLocalidad($coleccion = array(), $coleccion_localidad = array()) {
        $i=0;
        foreach ($coleccion as $valor) {
            foreach ($coleccion_localidad as $localidad) {
                if(isset($valor['localidadid']) && isset($localidad['id']) && $valor['localidadid']==$localidad['id']){                    
                    $valor['localidad'] = $localidad['nombre'];
                    $coleccion[$i] = $valor;
                }
            }
            $i++;
        }
        
        return $coleccion;
    }
    
    /**
     * Se obtienen los id de localidades que están vinculadas a la coleccion
     * @param array $coleccion
     * @return array
     */
    static function obtenerLocalidadIdDeColeccion($coleccion = array()) {
        $lugarForm = new LugarForm();
        $ids='';
        $pagesize = count($coleccion); 
        foreach ($coleccion as $valor) {
            #si esta seteada la localidad
            if(isset($valor['localidadid'])){
                $ids .= (empty($ids))?$valor['localidadid']:','.$valor['localidadid'];
            }
            
        }
        
        $coleccion = $lugarForm->buscarLocalidadEnSistemaLugar(array("ids"=>$ids,"pagesize"=>$pagesize));
        
        return $coleccion;
    }
    
    /**
     * Se vincular los datos de lugar asociado a una prestacion
     * @param array $coleccion que tiene vinculo con datos de lugar
     * @return array
     */
    static function obtenerYVincularParametrosDeLugar($coleccion = array()) {
        
        #Hacemos el pedido de los parametros
        $parametrosLugar = \Yii::$app->lugar->obtenerParametro();
        
        $i = 0;
        foreach ($coleccion as $prestacion) {
            
            if(isset($prestacion['localidadid']) && !empty($prestacion['localidadid'])){
                foreach ($parametrosLugar['localidad'] as $value) {
                    if($prestacion['localidadid'] == $value['id']){
                        $prestacion['localidad'] = $value['nombre'];
                    }
                }
            }
            
            if(isset($prestacion['responsable_entrega']['tipo_responsableid']) && !empty($prestacion['responsable_entrega']['tipo_responsableid'])){
                switch ($prestacion['responsable_entrega']['tipo_responsableid']) {
                    case \app\models\Recurso::TIPO_RESPONSABLE_DELEGACION :
                        foreach ($parametrosLugar['delegacion'] as $value) {
                            if($prestacion['responsable_entrega']['responsable_entregaid'] == $value['id']){
                                $prestacion['responsable_entrega']['responsable_entrega'] = $value['nombre'] .' (Delegación)';
                            }
                        }
                        break;
                    case \app\models\Recurso::TIPO_RESPONSABLE_MUNICIPIO :
                        foreach ($parametrosLugar['municipio'] as $value) {
                            if($prestacion['responsable_entrega']['responsable_entregaid'] == $value['id']){
                                $prestacion['responsable_entrega']['responsable_entrega'] = $value['nombre'] .' (Municipio)';
                            }
                        }
                        break;
                    case \app\models\Recurso::TIPO_RESPONSABLE_COMISION_FOMENTO :
                        foreach ($parametrosLugar['comision_fomento'] as $value) {
                            if($prestacion['responsable_entrega']['responsable_entregaid'] == $value['id']){
                                $prestacion['responsable_entrega']['responsable_entrega'] = $value['nombre'] .' (Comision de Fomento)';
                            }
                        }
                        break;
                }
            }

            $coleccion[$i] = $prestacion;
            $i++;
        }
        
        return $coleccion;
    }
}