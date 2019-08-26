<?php 

use Helper\Api;
class programaCest
{
    /**
     *
     * @var Helper\Api
     */    
    protected $api;
    
    public function _before(ApiTester $I,Api $api)
    {
        $I->wantTo('Login');
        $token = $api->generarToken();
        $I->amBearerAuthenticated($token);
    }
    
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
                "id"=> 1,
                "nombre"=> "Subsidio",
                "activo"=> null,
                "lista_tipo_recurso"=> [
                    [
                        "id"=> 1,
                        "nombre"=> "Alimentación"
                    ],
                    [
                        "id"=> 3,
                        "nombre"=> "Mejora Habitacional"
                    ]
                ]
            ],
            [
                "id"=> 2,
                "nombre"=> "Río Negro Presente",
                "activo"=> null,
                "lista_tipo_recurso"=> [
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
                ]
            ],
            [
                "id"=> 3,
                "nombre"=> "Emprender",
                "activo"=> null,
                "lista_tipo_recurso"=> [
                    [
                        "id"=> 2,
                        "nombre"=> "Empleo/Formación Laboral"
                    ]
                ]
            ],
            [
                "id"=> 4,
                "nombre"=> "Micro Emprendimiento",
                "activo"=> null,
                "lista_tipo_recurso"=> [
                    [
                        "id"=> 2,
                        "nombre"=> "Empleo/Formación Laboral"
                    ]
                ]
            ],
            [
                "id"=> 5,
                "nombre"=> "Hábitat",
                "activo"=> null,
                "lista_tipo_recurso"=> [
                    [
                        "id"=> 3,
                        "nombre"=> "Mejora Habitacional"
                    ]
                ]
            ]
        ]);
        
        $I->seeResponseCodeIs(200);        
        
    }
    
    
}
