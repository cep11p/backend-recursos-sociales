<?php 

use Helper\Api;
class beneficiarioCest
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
           'pagesize' => 20,
           'pages' => 2,
           'total_filtrado' => 27,
           "monto_acreditado"=> 549345.03,
           "monto_baja"=> 543897.16,
           "monto_sin_acreditar"=> 250641.33,
           "recurso_acreditado_cantidad"=> 32,
           "recurso_baja_cantidad"=> 27,
           'resultado' => array(
               [
                "personaid"=> 1,
                "monto"=> 64826.61,
                "baja"=> false,
                "acreditacion"=> false,
                "monto_acreditado"=> 35791.47,
                "monto_baja"=> 29035.14,
                "monto_sin_acreditar"=> 0,
                "recurso_cantidad"=> 5,
                "recurso_baja_cantidad"=> 2,
                "recurso_acreditado_cantidad"=> 3,
                "recurso_sin_acreditar_cantidad"=> 0,
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
                    "personaid"=> 2,
                    "monto"=> 123690.15,
                    "baja"=> false,
                    "acreditacion"=> false,
                    "monto_acreditado"=> 99868.16,
                    "monto_baja"=> 23821.99,
                    "monto_sin_acreditar"=> 7.2759576141834e-12,
                    "recurso_cantidad"=> 5,
                    "recurso_baja_cantidad"=> 2,
                    "recurso_acreditado_cantidad"=> 3,
                    "recurso_sin_acreditar_cantidad"=> 0,
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
    
    /**
     * @param ApiTester $I
     */
    public function viewBeneficiario(ApiTester $I)
    {
        $I->wantTo('Se visualiza un beneficiario');
        
        $I->sendGET('/api/beneficiarios/1');
        
        $I->seeResponseContainsJson([
            'id' => 1,
            'nombre' => 'Victoria Margarita',
            'apellido' => 'González',
            'nro_documento' => '23851266',
            'cuil' => '20238512669',
            'fecha_nacimiento' => '1982-12-30',
            'celular' => '2920412227',
            'sexoid' => 2,
            'nucleoid' => 1,
            'estado_civilid' => 1,
            'telefono' => '2920430000',
            'tipo_documentoid' => 1,
            'generoid' => 2,
            'email' => 'email22@correo.com',
            'red_social' => 'redsocial1',
            'situacion_laboralid' => 1,
            'lugar' => Array (),
            "recurso_lista"=> [
                
                [
                    "programa"=> "Emprender",
                    "recurso_cantidad"=> 2,
                    "recursos"=> [
                        [
                            "id"=> 31,
                            "fecha_inicial"=> "2017-12-10",
                            "fecha_alta"=> "2016-05-08",
                            "monto"=> 13245.5,
                            "observacion"=> "Observacion Fixture 31",
                            "proposito"=> "Un proposito hecho con fixtures 31",
                            "programaid"=> 3,
                            "tipo_recursoid"=> 1,
                            "personaid"=> 1,
                            "fecha_baja"=> "2018-01-09",
                            "fecha_acreditacion"=> "2016-05-09",
                            "descripcion_baja"=> null,
                            "programa"=> "Emprender",
                            "tipo_recurso"=> "Alimentación",
                            "baja"=> true,
                            "acreditacion"=> true
                        ],
                        [
                            "id"=> 1,
                            "fecha_inicial"=> "2016-01-30",
                            "fecha_alta"=> "2014-10-07",
                            "monto"=> 3212.23,
                            "observacion"=> "Observacion Fixture 1",
                            "proposito"=> "Un proposito hecho con fixtures 1",
                            "programaid"=> 3,
                            "tipo_recursoid"=> 1,
                            "personaid"=> 1,
                            "fecha_baja"=> null,
                            "fecha_acreditacion"=> "2014-11-07",
                            "descripcion_baja"=> null,
                            "programa"=> "Emprender",
                            "tipo_recurso"=> "Alimentación",
                            "baja"=> false,
                            "acreditacion"=> true
                        ]
                    ]
                ],
                [
                    "programa"=> "Río Negro Presente",
                    "recurso_cantidad"=> 2,
                    "recursos"=> [
                        [
                            "id"=> 54,
                            "fecha_inicial"=> "2017-11-17",
                            "fecha_alta"=> "2018-09-07",
                            "monto"=> 15789.64,
                            "observacion"=> "Observacion Fixture 54",
                            "proposito"=> "Un proposito hecho con fixtures 54",
                            "programaid"=> 2,
                            "tipo_recursoid"=> 2,
                            "personaid"=> 1,
                            "fecha_baja"=> null,
                            "fecha_acreditacion"=> "2018-09-12",
                            "descripcion_baja"=> null,
                            "programa"=> "Río Negro Presente",
                            "tipo_recurso"=> "Empleo/Formación Laboral",
                            "baja"=> false,
                            "acreditacion"=> true
                        ],
                        [
                            "id"=> 21,
                            "fecha_inicial"=> "2016-01-10",
                            "fecha_alta"=> "2016-05-18",
                            "monto"=> 15789.64,
                            "observacion"=> "Observacion Fixture 21",
                            "proposito"=> "Un proposito hecho con fixtures 21",
                            "programaid"=> 2,
                            "tipo_recursoid"=> 3,
                            "personaid"=> 1,
                            "fecha_baja"=> "2016-06-18",
                            "fecha_acreditacion"=> null,
                            "descripcion_baja"=> null,
                            "programa"=> "Río Negro Presente",
                            "tipo_recurso"=> "Mejora Habitacional",
                            "baja"=> true,
                            "acreditacion"=> false
                        ]
                    ]
                ],
                [
                    "programa"=> "Subsidio",
                    "recurso_cantidad"=> 1,
                    "recursos"=> [
                        [
                            "id"=> 11,
                            "fecha_inicial"=> "2016-01-20",
                            "fecha_alta"=> "2016-05-28",
                            "monto"=> 16789.6,
                            "observacion"=> "Observacion Fixture 11",
                            "proposito"=> "Un proposito hecho con fixtures 11",
                            "programaid"=> 1,
                            "tipo_recursoid"=> 2,
                            "personaid"=> 1,
                            "fecha_baja"=> null,
                            "fecha_acreditacion"=> "2016-06-28",
                            "descripcion_baja"=> null,
                            "programa"=> "Subsidio",
                            "tipo_recurso"=> "Empleo/Formación Laboral",
                            "baja"=> false,
                            "acreditacion"=> true
                        ]
                    ]
                ]
            ]
        ]);
        
        $I->seeResponseCodeIs(200);
    }
}
