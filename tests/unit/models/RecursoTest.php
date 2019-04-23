<?php 

use app\models\Recurso;
class RecursoTest extends \Codeception\Test\Unit
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

    public function testFallaCrearRecursoSiDatosVacios()
    {
        $this->tester->haveFixtures([
            \app\tests\fixtures\RecursoFixture::className()
        ]);
        
        $model = new Recurso();  
        
        $errors = Array(
            'fecha_inicial' => Array (
                0 => 'Fecha Inicial cannot be blank.'
            ),
            'fecha_alta' => Array (
                0 => 'Fecha Alta cannot be blank.'
            ),
            'monto' => Array (
                0 => 'Monto cannot be blank.'
            ),
            'programaid' => Array (
                0 => 'Programaid cannot be blank.'
            ),
            'tipo_recursoid' => Array (
                0 => 'Tipo Recursoid cannot be blank.'
            ),
            'personaid' => Array (
                0 => 'Personaid cannot be blank.'
            ),
        );
        $model->validate();
        $this->assertArraySubset($model->getErrors(),$errors);
    }
    
    public function testFallaDarBajaRecursoSiDatosVacios()
    {
        $this->tester->haveFixtures([
            \app\tests\fixtures\RecursoFixture::className()
        ]);
        
        $model = Recurso::findOne(['id'=>1]);  
        
        $model->scenario = $model::SCENARIO_BAJA;
        
        $errors = Array(
                        'fecha_baja' => Array(
                            0 => 'Fecha Baja cannot be blank.'
                        ),
                        'descripcion_baja' => Array(
                            0 => 'Descripcion Baja cannot be blank.'
                        )
                    );
        $model->validate();
        $this->assertArraySubset($model->getErrors(),$errors);
    }
    
    public function testFallaDarBajaRecursoSiFechaBajaEsMenorAFechaAlta()
    {
        $this->tester->haveFixtures([
            \app\tests\fixtures\RecursoFixture::className()
        ]);
        
        $model = Recurso::findOne(['id'=>1]);  
        
        $model->scenario = $model::SCENARIO_BAJA;
        $model->fecha_baja = '2014-10-06';
        $model->descripcion_baja = 'Esto es una descripcion de prueba';

        $errors = Array(
            'fecha_baja' => Array(
                0 => 'La fecha de baja no puede ser menor a la fecha de alta 07/10/2014'
            )
        );
        $model->validate();
        $this->assertArraySubset($model->getErrors(),$errors);
    }
    
    public function testFallaDarBajaRecursoSiFechaBajaEsMayorAHoy()
    {
        $this->tester->haveFixtures([
            \app\tests\fixtures\RecursoFixture::className()
        ]);
        
        $model = Recurso::findOne(['id'=>1]);
        $model->scenario = $model::SCENARIO_BAJA;
        $model->fecha_baja = date("Y-m-d",strtotime(date('Y-m-d')."+ 1 days"));
        $model->descripcion_baja = 'Esto es una descripcion de ejemplo';
        
        $errors = Array(
            'fecha_baja' => Array(
                0 => 'La fecha de baja no puede ser mayor a la fecha de hoy '.date('d/m/Y')
            )
        );
        $model->validate();
        $this->assertArraySubset($model->getErrors(),$errors);
    }
    
    public function testFallaAcreditarRecursoSiDatosVacios()
    {
        $this->tester->haveFixtures([
            \app\tests\fixtures\RecursoFixture::className()
        ]);
        
        $model = Recurso::findOne(['id'=>22]);  
        $model->scenario = $model::SCENARIO_ACREDITACION;
        
        $errors = Array(
            'fecha_acreditacion' => Array (
                0 => 'Fecha Acreditacion cannot be blank.'
            )

        );
        $model->validate();
        $this->assertArraySubset($model->getErrors(),$errors);
    }
    
    public function testFallaAcreditarSiFechaAcreditacionEsMenorAFechaAlta()
    {
        $this->tester->haveFixtures([
            \app\tests\fixtures\RecursoFixture::className()
        ]);
        
        $model = Recurso::findOne(['id'=>22]);  
        $model->scenario = $model::SCENARIO_ACREDITACION;
        $model->fecha_acreditacion = '2016-05-16';
        
        $errors = Array(
            'fecha_acreditacion' => Array (
                0 => 'La fecha de acreditacion no puede ser menor a la fecha de alta 17/05/2016'
            )
        );
        $model->validate();
        $this->assertArraySubset($model->getErrors(),$errors);
    }
    
    public function testFallaAcreditarSiFechaAcreditacionEsMayorAHoy()
    {
        $this->tester->haveFixtures([
            \app\tests\fixtures\RecursoFixture::className()
        ]);
        
        $model = Recurso::findOne(['id'=>22]);
        $model->scenario = $model::SCENARIO_ACREDITACION;
        $model->fecha_acreditacion = date("Y-m-d",strtotime(date('Y-m-d')."+ 1 days"));
        
        $errors = Array(
            'fecha_acreditacion' => Array(
                0 => 'La fecha de acreditacion no puede ser mayor a la de hoy '.date('d/m/Y')
            )
        );
        $model->validate();
        $this->assertArraySubset($model->getErrors(),$errors);
    }
}