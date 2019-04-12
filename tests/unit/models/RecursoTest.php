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
}