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
            'recursos' => app\tests\fixtures\RecursoFixture::className(),
        ];
    }
    
    

    /**
     * @param ApiTester $I
     */
    public function listarBeneficiarios(ApiTester $I)
    {
        $I->wantTo('Se listan los beneficiarios');
        
        $I->sendGET('/api/beneficiarios');
        
        $I->seeResponseContainsJson([
           'success' => true,
           'pagesize' => 20,
           'pages' => 2,
           'total_filtrado' => 27,
           'resultado' => array(
               [
                    "monto"=> 64826.61,
                    "personaid"=> 1,
                    "recurso_cantidad"=> "5",
                    "persona"=> [
                        "id"=> 1,
                        "nombre"=> "Victoria Margarita",
                        "apellido"=> "González",
                        "nro_documento"=> "23851266",
                        "fecha_nacimiento"=> "1982-12-30",
                        "estado_civilid"=> 1,
                        "telefono"=> "2920430000",
                        "celular"=> "2920412227",
                        "sexoid"=> 2,
                        "tipo_documentoid"=> 1,
                        "nucleoid"=> 1,
                        "situacion_laboralid"=> 1,
                        "generoid"=> 2,
                        "email"=> "email22@correo.com",
                        "cuil"=> "20238512669",
                        "red_social"=> "redsocial1",
                        "lugar"=> [
                            "id"=> 1,
                            "calle"=> "calle1",
                            "altura"=> "100",
                            "localidadid"=> 2538,
                            "latitud"=> "-1234123",
                            "longitud"=> "21314124",
                            "barrio"=> "barrio1",
                            "piso"=> "0º",
                            "depto"=> "A",
                            "escalera"=> "escalera1",
                            "entre_calle_1"=> "Entrecalle1",
                            "entre_calle_2"=> "Entrecalle-103",
                        ]
                    ]
                ],
                [
                    "monto"=> 123690.15,
                    "personaid"=> 2,
                    "recurso_cantidad"=> "5",
                    "persona"=> [
                        "id"=> 2,
                        "nombre"=> "Isabel Sofía",
                        "apellido"=> "Rodríguez",
                        "nro_documento"=> "32054238",
                        "fecha_nacimiento"=> "1982-12-29",
                        "estado_civilid"=> 2,
                        "telefono"=> "2920430001",
                        "celular"=> "2920412228",
                        "sexoid"=> 2,
                        "tipo_documentoid"=> 2,
                        "nucleoid"=> 2,
                        "situacion_laboralid"=> 2,
                        "generoid"=> 2,
                        "email"=> 'email22@correo.com',
                        "cuil"=> "20320542389",
                        "red_social"=> 'redsocial2',
                        "lugar"=> [
                            "id"=> 2,
                            "calle"=> "calle2",
                            "altura"=> "",
                            "localidadid"=> 2539,
                            "latitud"=> "-1234122",
                            "longitud"=> "21314125",
                            "barrio"=> "barrio2",
                            "piso"=> "1º",
                            "depto"=> "B",
                            "escalera"=> "escalera2",
                            "entre_calle_1"=> "Entrecalle2",
                            "entre_calle_2"=> "Entrecalle-102",
                        ]
                    ]
                ]
           )
        ]);
        
        $I->seeResponseCodeIs(200);
        
        
    }
}
