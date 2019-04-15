<?php 

class programaCest
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
    public function  listarProgramas(ApiTester $I)
    {
        $I->wantTo('Se listan los programas');
        
        $I->sendGET('/api/programas');
        
        $I->seeResponseContainsJson([
            [
                "id"=> 3,
                "nombre"=> "Emprender",
                "monto_acreditado"=> 173651.6,
                "monto_baja"=> 156349.98,
                "monto_sin_acreditar"=> 97780.02,
                "recurso_cantidad"=> 24,
                "recurso_baja_cantidad"=> 9,
                "recurso_acreditado_cantidad"=> 11,
                "persona_cantidad"=> 20,
                "monto"=> 427781.6
            ],
            [
                "id"=> 5,
                "nombre"=> "Hábitat",
                "monto_acreditado"=> 0,
                "monto_baja"=> 0,
                "monto_sin_acreditar"=> 0,
                "recurso_cantidad"=> 0,
                "recurso_baja_cantidad"=> 0,
                "recurso_acreditado_cantidad"=> 0,
                "persona_cantidad"=> 0,
                "monto"=> 0
            ],
            [
                "id"=> 4,
                "nombre"=> "Micro Emprendimiento",
                "monto_acreditado"=> 0,
                "monto_baja"=> 0,
                "monto_sin_acreditar"=> 0,
                "recurso_cantidad"=> 0,
                "recurso_baja_cantidad"=> 0,
                "recurso_acreditado_cantidad"=> 0,
                "persona_cantidad"=> 0,
                "monto"=> 0
            ],
            [
                "id"=> 2,
                "nombre"=> "Río Negro Presente",
                "monto_acreditado"=> 173973.98,
                "monto_baja"=> 208151.32,
                "monto_sin_acreditar"=> 76614.33,
                "recurso_cantidad"=> 23,
                "recurso_baja_cantidad"=> 9,
                "recurso_acreditado_cantidad"=> 10,
                "persona_cantidad"=> 19,
                "monto"=> 458739.63
            ],
            [
                "id"=> 1,
                "nombre"=> "Subsidio",
                "monto_acreditado"=> 201719.45,
                "monto_baja"=> 179395.86,
                "monto_sin_acreditar"=> 76246.98,
                "recurso_cantidad"=> 24,
                "recurso_baja_cantidad"=> 9,
                "recurso_acreditado_cantidad"=> 11,
                "persona_cantidad"=> 20,
                "monto"=> 457362.29
            ]
        ]);
        
        $I->seeResponseCodeIs(200);        
        
    }
    
    
}
