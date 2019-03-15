<?php 

class beneficiarioCest
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
    
    public function _fixtures()
    {
        return [
//            'recursos' => app\tests\fixtures\RecursoFixture::className(),
        ];
    }
    
    

    /**
     * @param ApiTester $I
     */
    public function crearDestinatarioSinPersona(ApiTester $I)
    {
        $I->wantTo('Se registra un destinatario sin Persona');
        
        $I->sendGET('/api/beneficiarios');
        
        $I->seeResponseContainsJson([
            'algo' => 1,
        ]);
        
        $I->seeResponseCodeIs(200);
        
        
    }
}
