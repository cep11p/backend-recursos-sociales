<?php 

class recursoCest
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
    public function  listarRecursos(ApiTester $I)
    {
        $I->wantTo('Se listan los recurso');
        
        $I->sendGET('/api/recursos');
        
        $I->seeResponseContainsJson([
            "success"=> true,
            "pagesize"=> 20,
            "pages"=> 4,
            "total_filtrado"=> 71,
            "monto_total"=> "1343883.5199999998",
            "resultado"=> [
                [
                    "id"=> 40,
                    "fecha_inicial"=> "2043-07-00",
                    "fecha_alta"=> "2019-10-11",
                    "monto"=> 15789.64,
                    "observacion"=> "Observacion Fixture 40",
                    "proposito"=> "Un proposito hecho con fixtures 40",
                    "programaid"=> 3,
                    "tipo_recursoid"=> 2,
                    "personaid"=> 14,
                    "fecha_baja"=> null,
                    "fecha_acreditacion"=> null,
                    "descripcion_baja"=> null,
                    "programa"=> "Emprender",
                    "tipo_recurso"=> "Empleo/Formación Laboral",
                    "persona"=> [
                        "id"=> 14,
                        "nombre"=> "Jessica Daniela",
                        "apellido"=> "Ramírez",
                        "apodo"=> "",
                        "nro_documento"=> "12382584",
                        "fecha_nacimiento"=> "0000-00-00",
                        "estado_civilid"=> null,
                        "telefono"=> "",
                        "celular"=> "",
                        "sexoid"=> 2,
                        "tipo_documentoid"=> null,
                        "nucleoid"=> 14,
                        "situacion_laboralid"=> null,
                        "generoid"=> null,
                        "email"=> "",
                        "cuil"=> "15123825843",
                        "red_social"=> "",
                        "estudios"=> [],
                        "sexo"=> "Mujer",
                        "genero"=> "",
                        "estado_civil"=> "",
                        "lugar"=> [
                            "id"=> 14,
                            "nombre"=> "",
                            "calle"=> "calle14",
                            "altura"=> "",
                            "localidadid"=> 2551,
                            "latitud"=> "-1234110",
                            "longitud"=> "21314137",
                            "barrio"=> "barrio5",
                            "piso"=> "13º",
                            "depto"=> "A",
                            "escalera"=> "",
                            "entre_calle_1"=> "",
                            "entre_calle_2"=> "",
                            "localidad"=> "Sierra Colorada"
                        ]
                    ]
                ],
                [
                    "id"=> 41,
                    "fecha_inicial"=> "2043-07-01",
                    "fecha_alta"=> "2019-10-10",
                    "monto"=> 14456,
                    "observacion"=> "Observacion Fixture 41",
                    "proposito"=> "Un proposito hecho con fixtures 41",
                    "programaid"=> 1,
                    "tipo_recursoid"=> 3,
                    "personaid"=> 15,
                    "fecha_baja"=> null,
                    "fecha_acreditacion"=> null,
                    "descripcion_baja"=> null,
                    "programa"=> "Subsidio",
                    "tipo_recurso"=> "Mejora Habitacional",
                    "persona"=> [
                        "id"=> 15,
                        "nombre"=> "Giselle Paola",
                        "apellido"=> "Álvarez",
                        "apodo"=> "",
                        "nro_documento"=> "12057263",
                        "fecha_nacimiento"=> "0000-00-00",
                        "estado_civilid"=> null,
                        "telefono"=> "",
                        "celular"=> "",
                        "sexoid"=> 2,
                        "tipo_documentoid"=> null,
                        "nucleoid"=> 15,
                        "situacion_laboralid"=> null,
                        "generoid"=> null,
                        "email"=> "",
                        "cuil"=> "15120572633",
                        "red_social"=> "",
                        "estudios"=> [],
                        "sexo"=> "Mujer",
                        "genero"=> "",
                        "estado_civil"=> "",
                        "lugar"=> [
                            "id"=> 15,
                            "nombre"=> "",
                            "calle"=> "calle15",
                            "altura"=> "",
                            "localidadid"=> 2552,
                            "latitud"=> "-1234109",
                            "longitud"=> "21314138",
                            "barrio"=> "barrio6",
                            "piso"=> "14º",
                            "depto"=> "B",
                            "escalera"=> "",
                            "entre_calle_1"=> "",
                            "entre_calle_2"=> "",
                            "localidad"=> "Treneta"
                        ]
                    ]
                ]
            ]
        ]);
        
        $I->seeResponseCodeIs(200);
        
        
    }
}
