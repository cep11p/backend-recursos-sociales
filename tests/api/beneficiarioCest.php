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
                        "apodo"=> "",
                        "nro_documento"=> "23851266",
                        "fecha_nacimiento"=> "1982-12-30",
                        "estado_civilid"=> null,
                        "telefono"=> "",
                        "celular"=> "2920412227",
                        "sexoid"=> 2,
                        "tipo_documentoid"=> null,
                        "nucleoid"=> 1,
                        "situacion_laboralid"=> null,
                        "generoid"=> null,
                        "email"=> "",
                        "cuil"=> "20238512669",
                        "red_social"=> "",
                        "estudios"=> [],
                        "sexo"=> "Mujer",
                        "genero"=> "",
                        "estado_civil"=> "",
                        "lugar"=> [
                            "id"=> 1,
                            "nombre"=> "",
                            "calle"=> "calle1",
                            "altura"=> "100",
                            "localidadid"=> 2538,
                            "latitud"=> "-1234123",
                            "longitud"=> "21314124",
                            "barrio"=> "barrio1",
                            "piso"=> "0º",
                            "depto"=> "A",
                            "escalera"=> "",
                            "entre_calle_1"=> "",
                            "entre_calle_2"=> "",
                            "localidad"=> "El Bolson"
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
                        "apodo"=> "",
                        "nro_documento"=> "32054238",
                        "fecha_nacimiento"=> "1982-12-29",
                        "estado_civilid"=> null,
                        "telefono"=> "",
                        "celular"=> "2920412228",
                        "sexoid"=> 2,
                        "tipo_documentoid"=> null,
                        "nucleoid"=> 2,
                        "situacion_laboralid"=> null,
                        "generoid"=> null,
                        "email"=> "",
                        "cuil"=> "20320542389",
                        "red_social"=> "",
                        "estudios"=> [
                            [
                                "id"=> 1,
                                "titulo"=> "Titulo fixture 1",
                                "completo"=> 1,
                                "en_curso"=> 0,
                                "nivel_educativoid"=> 1,
                                "nivel_educativo"=> "Pre-Escolar",
                                "anio"=> "2001"
                            ],
                            [
                                "id"=> 2,
                                "titulo"=> "Titulo fixture 2",
                                "completo"=> 1,
                                "en_curso"=> 0,
                                "nivel_educativoid"=> 2,
                                "nivel_educativo"=> "Primario",
                                "anio"=> "2001"
                            ]
                        ],
                        "sexo"=> "Mujer",
                        "genero"=> "",
                        "estado_civil"=> "",
                        "lugar"=> [
                            "id"=> 2,
                            "nombre"=> "",
                            "calle"=> "calle2",
                            "altura"=> "",
                            "localidadid"=> 2539,
                            "latitud"=> "-1234122",
                            "longitud"=> "21314125",
                            "barrio"=> "barrio2",
                            "piso"=> "1º",
                            "depto"=> "B",
                            "escalera"=> "",
                            "entre_calle_1"=> "",
                            "entre_calle_2"=> "",
                            "localidad"=> "San Carlos De Bariloche"
                        ]
                    ]
                ]
           )
        ]);
        
        $I->seeResponseCodeIs(200);
        
        
    }
}
