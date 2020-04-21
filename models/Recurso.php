<?php

namespace app\models;

use Yii;
use \app\models\base\Recurso as BaseRecurso;
use yii\helpers\ArrayHelper;

use yii\base\Exception;

/**
 * This is the model class for table "recurso".
 */
class Recurso extends BaseRecurso
{
    const SCENARIO_BAJA = 'baja';
    const SCENARIO_ACREDITACION = 'acreditacion';
    const PRESTACION_MODULO_ALIMENTAR_ID = 6;
    const PRESTACION_MODULO_ALIMENTAR = 6;
    const TIPO_RESPONSABLE_MUNICIPIO= 1;
    const TIPO_RESPONSABLE_DELEGACION= 2;
    const TIPO_RESPONSABLE_COMISION_FOMENTO= 3;
    
    /**
     * Atributo correspondiente a la tabla responsable, esto nos permite hacer un join con responsable y poder filtrar prestaciones de tipo reponsable
     * @var int 
     */
    public $tipo_responsableid;
    
    /**
     * variable auxiliar
     * cuantifica la cantidad de recursos que tiene un beneficiario
     * @var int 
     */
    public $recurso_cantidad;    
    /**
     * Variable auxiliar para filtrado
     * Es el monto total del filtrado aplicado en ese momento
     * @var double 
     */
    public $monto_total;    
    /**
     * Variable auxiliar para filtrado
     * Es el monto acreditado
     * @var double 
     */
    public $monto_acreditado;
    /**
     * Variable auxiliar para filtrado
     * Es el monto baja
     * @var double 
     */
    public $monto_baja;
    /**
     * Variable auxiliar para filtrado
     * Es la cantidad de recursos baja
     * @var int
     */
    public $recurso_baja_cantidad;
    /**
     * Variable auxiliar para filtrado
     * Es la cantidad de recursos acreditado
     * @var int
     */
    public $recurso_acreditado_cantidad;


    public function behaviors()
    {
        return ArrayHelper::merge(
            parent::behaviors(),
            [
                # custom behaviors
            ]
        );
    }
    
    public function rules()
    {
        return ArrayHelper::merge(
            parent::rules(),
            [
                ['monto', 'double'],
                [['localidadid'], 'required','message' =>'No hay localidad asignada a la prestación'],
                [['cant_modulo','personaid'], 'required', 'on' => self::PRESTACION_MODULO_ALIMENTAR],
                [['descripcion_baja', 'fecha_baja'], 'required', 'on' => self::SCENARIO_BAJA],
                [['fecha_acreditacion'], 'required', 'on' => self::SCENARIO_ACREDITACION],
                [['fecha_baja','fecha_acreditacion','fecha_inicial','fecha_alta'], 'date', 'format' => 'php:Y-m-d'],
                ['fecha_baja', 'validarFechaBaja'],
                ['fecha_alta', 'validarFechaAlta'],
                ['fecha_acreditacion', 'validarFechaAcreditacion'],
                ['personaid', 'existePersonaEnRegistral'],
                ['localidadid', 'existeLocalidadEnLugar'],
                ['personaid', 'compare','compareValue'=>0,'operator'=>'!=','message' => 'No se pudo registrar la persona correctamente en el Sistema Registral.']
            ]
        );
    }
    
    public function setAttributesCustom($values, $safeOnly = true) {
        parent::setAttributes($values, $safeOnly);
        $this->fecha_inicial = date('Y-m-d');           
    }
    
    /**
     * Realizamos el registro de un reponsable
     * @param array $param atributos de la tabla responsable
     * @throws Exception
     */
    public function setResponsableEntrega($param) {
        if(isset($this->programaid) && $this->programa->id == $this::PRESTACION_MODULO_ALIMENTAR_ID){
            $model = new ResponsableEntrega();
            $model->setAttributes($param);
            $model->recursoid = $this->id;

            if(!$model->save()){
                throw new Exception(json_encode($model->getErrors()));
            }
        }
    }


    public function validarFechaBaja(){          
        
        if(date('Y-m-d') < $this->fecha_baja){
            $this->addError('fecha_baja', 'La fecha de baja no puede ser mayor a la fecha de hoy '.date('d/m/Y'));
        }
        
        if($this->fecha_alta > $this->fecha_baja){
            $fechaAMostrar = \DateTime::createFromFormat("Y-m-d", $this->fecha_alta);
            $this->addError('fecha_baja', 'La fecha de baja no puede ser menor a la fecha de alta '.$fechaAMostrar->format('d/m/Y'));
        }
    }
    
    public function validarFechaAlta(){          
        
//        if(date('Y-m-d') < $this->fecha_alta){
//            $this->addError('fecha_alta', 'La fecha de alta no puede ser mayor a la fecha de hoy '.date('d/m/Y'));
//        }
    }
    
    public function validarFechaAcreditacion(){          
        
        if(date('Y-m-d') < $this->fecha_acreditacion){
            $this->addError('fecha_acreditacion', 'La fecha de acreditacion no puede ser mayor a la de hoy '.date('d/m/Y'));
        }
        
        if($this->fecha_alta > $this->fecha_acreditacion){
            $fechaAMostrar = \DateTime::createFromFormat("Y-m-d", $this->fecha_alta);
            $this->addError('fecha_acreditacion', 'La fecha de acreditacion no puede ser menor a la fecha de alta '.$fechaAMostrar->format('d/m/Y'));
        }        
    }
    
    public function existePersonaEnRegistral(){
        $response = \Yii::$app->registral->buscarPersonaPorId($this->personaid);     
        
        if(isset($response['estado']) && $response['estado']!=true){
            $this->addError('id', 'La persona con el id '.$this->personaid.' no existe!');
        }
    }
    
    public function existeLocalidadEnLugar(){
        $response = \Yii::$app->lugar->buscarLocalidadPorId($this->localidadid); 
        if(!isset($response['nombre'])){
            $this->addError('localidadid', 'La localidad con el id '.$this->localidadid.' no existe!');
        }
    }
    
    public function setAttributesAcreditar($values) {
        if(isset($values['fecha_acreditacion'])){
            $this->fecha_acreditacion = $values['fecha_acreditacion']; 
        }
    }
    
    public function setAttributesBaja($values) {
        if(isset($values['fecha_baja'])){
            $this->fecha_baja = $values['fecha_baja']; 
        }
        if(isset($values['descripcion_baja'])){
            $this->descripcion_baja = $values['descripcion_baja']; 
        }
    }

        /**
     * Se vinculan los alumnos(Persona) a la capacitación que brinda el programa Emprender, En otras palabras
     * se vinculan alumnos con el recurso_social
     * @throws Exception
     */
    public function vincularAlumnosAEmprender($param){
        if(!is_array($param['alumno_lista'])){
            throw new Exception("La lista de alumnos es invalida");
        }

        foreach ($param['alumno_lista'] as $vAula) { 
            if(!isset($vAula['alumnoid'])){
                throw new Exception("La lista de alumnos es invalida");
            }                   

            $aula = new Aula();
            $aula->setAttributes([
                'recursoid'=>$this->id,
                'alumnoid'=>$vAula['alumnoid']
            ]);

            if(!$aula->save()){
                $arrayErrors = $aula->getErrors();
                throw new Exception(json_encode($arrayErrors));
            }
        }
    }
    

    /**
     * Se obtiene los datos de una persona
     * para obtener este dato se requiere hacer una interoperabilidad con el sistema Registral
     * @return type
     */
    public function getPersona(){
        $resultado = null;
        $model = new PersonaForm();
        $arrayPersona = $model->obtenerPersonaConLugarYEstudios($this->personaid);

        if($arrayPersona){
            $resultado = $arrayPersona;
        }        
        
        return $resultado;       
        
    }
    
    /**
     * Se obtiene la localidad
     * para obtener este dato se requiere hacer una interoperabilidad con el sistema Lugar
     * @return array
     */
    public function getLocalidad(){
        $resultado = null;
        $model = new LugarForm();
        $arrayResultado = $model->buscarLocalidadPorIdEnSistemaLugar($this->localidadid);
        
        if($arrayResultado){
            $resultado = $arrayResultado['nombre'];
        }        
        
        return $resultado;       
        
    }
    
    /**
     * Se obtiene al responsable
     * @return array
     */
    public function getResponsableEntrega() {
        $resultado = array();
        if(parent::getResponsableEntrega()->one()!=null){
            $resultado = parent::getResponsableEntrega()->one()->toArray();
        }

        return $resultado;
    }
    
    /**
     * Se obtiene una lista de alumnos si es que el recurso tiene esa coleccion
     * @return array
     */
    public function getAlumnos(){
        $resultado = array();
        $personaForm = new PersonaForm();
        $ids='';

        foreach ($this->aulas as $value) {
            $ids .= (empty($ids))?$value->alumnoid:','.$value->alumnoid;
        }
        
        #Se van a obtener una lista de personas con la variable $ids
        if(!empty($ids)){
            $resultado = $personaForm->buscarPersonaEnRegistral(array("ids"=>$ids));
        }
        
        return $resultado;       
    }
    
    public function fields()
    {
        return ArrayHelper::merge(parent::fields(), [
            'programa'=> function($model){
                return $model->programa->nombre;
            },
            'tipo_recurso'=> function($model){
                return $model->tipoRecurso->nombre;
            },
            'responsable_entrega'=> function($model){
                return $model->responsableEntrega;
            },
            #Flags para injectar botones 
            'baja'=> function($model){
                $resultado = false;
                if(isset($model->fecha_baja)){
                    $resultado = true;
                }
                return $resultado;
            },
            #Flags para injectar botones
            'acreditacion'=> function($model){
                $resultado = false;
                if(isset($model->fecha_acreditacion)){
                    $resultado = true;
                }
                return $resultado;
            },
        ]);
        
    }
}
