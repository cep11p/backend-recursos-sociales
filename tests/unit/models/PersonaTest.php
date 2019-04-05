<?php 

use app\models\PersonaForm;
class PersonaTest extends \Codeception\Test\Unit
{
    /**
     * @var \UnitTester
     */
    protected $tester;
    
    protected function _before()
    {
        
    }

    protected function _after()
    {
    }

    public function testFallaCrearPersonaSiDatosVacios()
    {        
        $model = new PersonaForm();
        
        $errors = Array (
            'nombre' => Array(
                0 => 'Nombre cannot be blank.'
            ),
            'apellido' => Array(
                0 => 'Apellido cannot be blank.'
            ),
            'nro_documento' => Array(
                0 => 'Nro Documento cannot be blank.'
            ),
            'fecha_nacimiento' => Array(
                0 => 'Fecha Nacimiento cannot be blank.'
            )
        );

        $model->validate();
        $this->assertArraySubset($model->getErrors(),$errors);
    }
    
    public function testFallaSiPersonaNoExiste()
    {        
        $model = new PersonaForm();
        
        $errors = Array (
            'id' => Array(
                0 => 'La persona con el id 99999 no existe!'
            )
        );
        
        $model->setAttributes([
            "id"=>99999
        ]);
        $model->existeEnRegistral();
        $this->assertArraySubset($model->getErrors(),$errors);
    }
    
    public function testFallaSiNucleoIdNoExiste()
    {        
        $model = new PersonaForm();
        
        $errors = Array (
            'nucleoid' => Array(
                0 => 'El nucleo con el id 99999 no existe!'
            )
        );
        
        $model->setAttributes([
            "nucleoid"=>99999
        ]);
        $model->existeNucleoEnRegistral();
        $this->assertArraySubset($model->getErrors(),$errors);
    }
    
    public function testFallaCrearPersonaSiNroDocumentoExiste()
    {        
        $model = new PersonaForm();
        
        $errors = Array (
            'nro_documento' => Array (
                0 => 'El nro de documento 39396265 ya está en uso!'
            )
        );
        
        $model->setAttributes([
            "nro_documento"=>"39396265"
        ]);
        $model->existeNroDocumentoEnRegistral();
        $this->assertArraySubset($model->getErrors(),$errors);
    }
    
    public function testFallaMoficarPersonaSiNroDocumentoExiste()
    {        
        $model = new PersonaForm();
        
        $errors = Array (
            'nro_documento' => Array (
                0 => 'El nro de documento 39396265 ya está en uso!'
            )
        );
        
        $model->setAttributes([
            "id"=>6,
            "nro_documento"=>"39396265"
        ]);
        $model->existeNroDocumentoEnRegistral();
        $this->assertArraySubset($model->getErrors(),$errors);
    }
}