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
            "pagesize"=> 20,
            "pages"=> 3,
            "total_filtrado"=> 42,
            "monto_acreditado"=> 904370.88,
            "monto_baja"=> 577876.16,
            "monto_sin_acreditar"=> 393652.13,
            "recurso_acreditado_cantidad"=> 59,
            "recurso_baja_cantidad"=> 31,
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
                    "cuil"=> "20238512669",
                    "fecha_nacimiento"=> "1982-12-30",
                    "celular"=> "2920412227",
                    "sexoid"=> 2,
                    "nucleoid"=> 1,
                    "estado_civilid"=> 1,
                    "telefono"=> "2920430000",
                    "tipo_documentoid"=> 1,
                    "generoid"=> 2,
                    "email"=> "email22@correo.com",
                    "red_social"=> "redsocial1",
                    "situacion_laboralid"=> 1,
                    "lugar"=> [
                        "id"=> 1,
                        "barrio"=> "barrio1",
                        "calle"=> "calle1",
                        "altura"=> "100",
                        "piso"=> "0º",
                        "depto"=> "A",
                        "localidadid"=> 2538,
                        "latitud"=> "-1234123",
                        "longitud"=> "21314124",
                        "escalera"=> "escalera1",
                        "entre_calle_1"=> "Entrecalle1",
                        "entre_calle_2"=> "Entrecalle-103"
                    ]
                ]
            ],
            [
                "personaid"=> 2,
                "monto"=> 118189.99,
                "baja"=> false,
                "acreditacion"=> false,
                "monto_acreditado"=> 94368,
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
                    "cuil"=> "20320542389",
                    "fecha_nacimiento"=> "1982-12-29",
                    "celular"=> "2920412228",
                    "sexoid"=> 2,
                    "nucleoid"=> 2,
                    "estado_civilid"=> 2,
                    "telefono"=> "2920430001",
                    "tipo_documentoid"=> 2,
                    "generoid"=> 2,
                    "email"=> "email22@correo.com",
                    "red_social"=> "redsocial2",
                    "situacion_laboralid"=> 2,
                    "lugar"=> [
                        "id"=> 2,
                        "barrio"=> "barrio2",
                        "calle"=> "calle2",
                        "altura"=> "",
                        "piso"=> "1º",
                        "depto"=> "B",
                        "localidadid"=> 2539,
                        "latitud"=> "-1234122",
                        "longitud"=> "21314125",
                        "escalera"=> "escalera2",
                        "entre_calle_1"=> "Entrecalle2",
                        "entre_calle_2"=> "Entrecalle-102"
                    ]
                ]
            ],
            [
                "personaid"=> 3,
                "monto"=> 75524.99,
                "baja"=> false,
                "acreditacion"=> false,
                "monto_acreditado"=> 37611.49,
                "monto_baja"=> 37913.5,
                "monto_sin_acreditar"=> 7.2759576141834e-12,
                "recurso_cantidad"=> 5,
                "recurso_baja_cantidad"=> 2,
                "recurso_acreditado_cantidad"=> 3,
                "recurso_sin_acreditar_cantidad"=> 0,
                "persona"=> [
                    "id"=> 3,
                    "nombre"=> "Dulce María",
                    "apellido"=> "Gómez",
                    "nro_documento"=> "28414555",
                    "cuil"=> "20284145559",
                    "fecha_nacimiento"=> "1982-12-28",
                    "celular"=> "2920412229",
                    "sexoid"=> 2,
                    "nucleoid"=> 3,
                    "estado_civilid"=> 3,
                    "telefono"=> "2920430002",
                    "tipo_documentoid"=> 3,
                    "generoid"=> 2,
                    "email"=> "email22@correo.com",
                    "red_social"=> "redsocial3",
                    "situacion_laboralid"=> 3,
                    "lugar"=> [
                        "id"=> 3,
                        "barrio"=> "barrio3",
                        "calle"=> "calle3",
                        "altura"=> "",
                        "piso"=> "2º",
                        "depto"=> "C",
                        "localidadid"=> 2540,
                        "latitud"=> "-1234121",
                        "longitud"=> "21314126",
                        "escalera"=> "escalera3",
                        "entre_calle_1"=> "Entrecalle3",
                        "entre_calle_2"=> "Entrecalle-101"
                    ]
                ]
            ],
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
            "id"=> 1,
            "nombre"=> "Victoria Margarita",
            "apellido"=> "González",
            "nro_documento"=> "23851266",
            "cuil"=> "20238512669",
            "fecha_nacimiento"=> "1982-12-30",
            "celular"=> "2920412227",
            "sexoid"=> 2,
            "nucleoid"=> 1,
            "estado_civilid"=> 1,
            "telefono"=> "2920430000",
            "tipo_documentoid"=> 1,
            "generoid"=> 2,
            "email"=> "email22@correo.com",
            "red_social"=> "redsocial1",
            "situacion_laboralid"=> 1,
            "lugar"=> [
                "id"=> 1,
                "barrio"=> "barrio1",
                "calle"=> "calle1",
                "altura"=> "100",
                "piso"=> "0º",
                "depto"=> "A",
                "localidadid"=> 2538,
                "latitud"=> "-1234123",
                "longitud"=> "21314124",
                "escalera"=> "escalera1",
                "entre_calle_1"=> "Entrecalle1",
                "entre_calle_2"=> "Entrecalle-103"
            ],
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
                            "descripcion_baja"=> "Esto es un argumento de baja",
                            "localidadid"=> 2640,
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
                            "localidadid"=> 2640,
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
                            "localidadid"=> 2626,
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
                            "descripcion_baja"=> "Esto es un argumento de baja",
                            "localidadid"=> 2599,
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
                            "localidadid"=> 2640,
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
