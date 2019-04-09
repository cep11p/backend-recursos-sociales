<?php 

class tipoRecursoCest
{
    /**
     *
     * @var Helper\Api
     */    
    protected $api;
    
//    public function _before(ApiTester $I,Api $api)
//    {
//        $I->wantTo('Login');
//        $token = $api->generarToken();
//        $I->amBearerAuthenticated($token);
//    }
    
//    public function _fixtures()
//    {
//        return [
//            'recursos' => app\tests\fixtures\RecursoFixture::className(),
//        ];
//    }
    
    

    /**
     * @param ApiTester $I
     */
    public function  listarTipoRecursos(ApiTester $I)
    {
        $I->wantTo('Se listan los tipo de recursos');
        
        $I->sendGET('/api/tipo-recursos');
        
        $I->seeResponseContainsJson([
            [
                "id"=> 1,
                "nombre"=> "Alimentación"
            ],
            [
                "id"=> 2,
                "nombre"=> "Empleo/Formación Laboral"
            ],
            [
                "id"=> 3,
                "nombre"=> "Mejora Habitacional"
            ]
        ]);
        
        $I->seeResponseCodeIs(200);        
        
    }
    
    /**
     * @param ApiTester $I
     */
    public function  listarTipoRecursosPorPrograma(ApiTester $I)
    {
        $I->wantTo('Se listan los tipo de recursos por programa');
        
        $I->sendGET('/api/tipo-recursos?programaid=5');
        
        $I->seeResponseContainsJson([          
            [
                "id"=> 3,
                "nombre"=> "Mejora Habitacional"
            ]            
        ]);
        
        $I->seeResponseCodeIs(200);        
        
    }
}
