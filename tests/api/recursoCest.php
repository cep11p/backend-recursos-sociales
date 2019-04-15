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
            "pagesize"=> 20,
            "pages"=> 4,
            "total_filtrado"=> 71,
            "monto_acreditado"=> 549345.03,
            "monto_baja"=> 543897.16,
            "monto_sin_acreditar"=> 250641.33,
            "recurso_acreditado_cantidad"=> 32,
            "recurso_baja_cantidad"=> 27,
            "resultado"=> [
                [
                    'id' => 61,
                    'fecha_inicial' => '2017-11-10',
                    'fecha_alta' => '2019-03-20',
                    'monto' => 19789.799999999999,
                    'observacion' => 'Observacion Fixture 61',
                    'proposito' => 'Un proposito hecho con fixtures 61',
                    "programaid"=> 3,
                    'tipo_recursoid' => 3,
                    'personaid' => 12,
                    'fecha_baja' => null,
                    'fecha_acreditacion' => null,
                    "descripcion_baja"=> null,
                    "programa"=> "Emprender",
                    "tipo_recurso"=> "Mejora Habitacional",
                    'baja' => false,
                    'acreditacion' => false,
                    "persona"=> [
                        'id' => 12,
                        'nombre' => 'Sandra Sofía',
                        'apellido' => 'Sosa',
                        'nro_documento' => '24187541',
                        'fecha_nacimiento' => '1980-10-15',
                        'estado_civilid' => 4,
                        'telefono' => '2920430011',
                        'celular' => '2920412238',
                        "sexoid"=> 2,
                        "tipo_documentoid"=> 3,
                        "nucleoid"=> 12,
                        "situacion_laboralid"=> 3,
                        "generoid"=> 2,
                        "email"=> "email22@correo.com",
                        "cuil"=> "15241875413",
                        "red_social"=> "redsocial12",
                        "lugar"=> [
                            "id"=> 12,
                            "calle"=> "calle12",
                            "altura"=> "",
                            'localidadid' => 2549,
                            'latitud' => '-1234112',
                            'longitud' => '21314135',
                            'barrio' => 'barrio3',
                            'piso' => '11º',
                            'depto' => '7',
                            'escalera' => 'escalera12',
                            'entre_calle_1' => 'Entrecalle12',
                            'entre_calle_2' => 'Entrecalle-92'
                        ]
                    ]
                ],
                [
                    'id' => 62,
                    'fecha_inicial' => '2018-03-30',
                    'fecha_alta' => '2019-03-19',
                    'monto' => 23123.119999999999,
                    'observacion' => 'Observacion Fixture 62',
                    'proposito' => 'Un proposito hecho con fixtures 62',
                    "programaid"=> 1,
                    "tipo_recursoid"=> 1,
                    "personaid"=> 13,
                    "fecha_baja"=> null,
                    "fecha_acreditacion"=> null,
                    "descripcion_baja"=> null,
                    "programa"=> "Subsidio",
                    "tipo_recurso"=> "Alimentación",
                    'baja' => false,
                    'acreditacion' => false,
                    "persona"=> [
                        'id' => 13,
                        'nombre' => 'Oriana Alejandra',
                        'apellido' => 'Torres',
                        'nro_documento' => '6078131',
                        'fecha_nacimiento' => '1980-10-14',
                        'estado_civilid' => 1,
                        'telefono' => '2920430012',
                        "celular"=> "",
                        "sexoid"=> 2,
                        "tipo_documentoid"=> 1,
                        "nucleoid"=> 13,
                        "situacion_laboralid"=> 1,
                        "generoid"=> 2,
                        "email"=> "email22@correo.com",
                        "cuil"=> "1560781313",
                        "red_social"=> "redsocial13",
                        "lugar"=> [
                            "id"=> 13,
                            "calle"=> "calle13",
                            "altura"=> "",
                            'localidadid' => 2550,
                            'latitud' => '-1234111',
                            'longitud' => '21314136',
                            'barrio' => 'barrio4',
                            'piso' => '12º',
                            'depto' => '8',
                            'escalera' => 'escalera13',
                            'entre_calle_1' => 'Entrecalle13',
                            'entre_calle_2' => 'Entrecalle-91',
                        ]
                    ]
                ]
            ]
        ]);
        
        $I->seeResponseCodeIs(200);
        
        
    }
    
    public function crearUnRecursoSubsidio(ApiTester $I)
    {
        $I->wantTo('Se crea un recurso de tipo Subsidio');
        
        $param = [            
            "personaid"=> 21,
            "programaid"=> 1,
            "tipo_recursoid"=> 3,
            "proposito"=> "Para comprar Alimentos",
            "fecha_alta"=> "2018-02-02",
            "monto"=> 220.300,
            "observacion"=> "Actualmente sin trabajo"
        ];
        
        $I->sendPOST('/api/recursos',$param);
        $I->seeResponseContainsJson([
            "message"=>"Se guarda una prestacion",
            "success"=>true,
            "data"=>["id"=>72]
        ]);
        $I->seeResponseCodeIs(200);
        
        $I->sendGET('/api/recursos/72');
        $I->seeResponseContainsJson([
            'id' => 72,
            'fecha_inicial' => date('Y-m-d'),
            'fecha_alta' => '2018-02-02',
            'monto' => 220.30000000000001,
            'observacion' => 'Actualmente sin trabajo',
            'proposito' => "Para comprar Alimentos",
            'programaid' => 1,
            'tipo_recursoid' => 3,
            'personaid' => 21,
            'fecha_baja' => null,
            'fecha_acreditacion' => null,
            'descripcion_baja' => null,
            'programa' => 'Subsidio',
            'tipo_recurso' => 'Mejora Habitacional',
            'baja' => false,
            'acreditacion' => false,
            'persona' => Array (),
        ]);
        
    }
    
    public function crearUnRecursoRioNegroPresente(ApiTester $I)
    {
        $I->wantTo('Se crea un recurso de tipo Río Negro Presente');
        
        $param = [            
            "personaid"=> 22,
            "programaid"=> 2,
            "tipo_recursoid"=> 1,
            "proposito"=> "Para comprar Alimentos",
            "fecha_alta"=> "2018-02-02",
            "monto"=> 220000.300,
            "observacion"=> "Actualmente sin trabajo"
        ];
        
        $I->sendPOST('/api/recursos',$param);
        $I->seeResponseContainsJson([
            "message"=>"Se guarda una prestacion",
            "success"=>true,
            "data"=>["id"=>73]
        ]);
        $I->seeResponseCodeIs(200);
        
        $I->sendGET('/api/recursos/73');
        $I->seeResponseContainsJson([
            'id' => 73,
            'fecha_inicial' => date('Y-m-d'),
            'fecha_alta' => '2018-02-02',
            'monto' => 220000.30000000000001,
            'observacion' => 'Actualmente sin trabajo',
            'proposito' => "Para comprar Alimentos",
            'programaid' => 2,
            'tipo_recursoid' => 1,
            'personaid' => 22,
            'fecha_baja' => null,
            'fecha_acreditacion' => null,
            'descripcion_baja' => null,
            'programa' => 'Río Negro Presente',
            'tipo_recurso' => 'Alimentación',
            'baja' => false,
            'acreditacion' => false,
            'persona' => Array (),
        ]);
        
    }
    
    public function crearUnRecursoEmprenderConAlumnos(ApiTester $I)
    {
        
        $I->haveFixtures([
            'aulas' => app\tests\fixtures\AulaFixture::className(),
        ]); 
        
        $I->wantTo('Se crea un recurso de tipo Emprender con Alumnos');
        
        $param = [            
            "personaid"=> 20,
            "programaid"=> 3,
            "tipo_recursoid"=> 3,
            "proposito"=> "Se desea armar un taller de apicultura",
            "fecha_alta"=> "2011-02-02",
            "monto"=> 220.302,
            "observacion"=> "Falta conseguir maquinas para la cosecha",
            "alumno_lista"=>[
                ["alumnoid"=>1],
                ["alumnoid"=>2],
                ["alumnoid"=>4],
                ["alumnoid"=>5],
                ["alumnoid"=>6],
                ["alumnoid"=>7],
                ["alumnoid"=>8],
                ["alumnoid"=>9]
            ]
        ];
        
        $I->sendPOST('/api/recursos',$param);
        $I->seeResponseContainsJson([
            "message"=>"Se guarda una prestacion",
            "success"=>true,
            "data"=>["id"=>74],
            'message' => 'Se guarda una prestacion'
        ]);
        $I->seeResponseCodeIs(200);
        
        $I->sendGET('/api/recursos/74');
        $I->seeResponseContainsJson([
            'id' => 74,
            'fecha_inicial' => date('Y-m-d'),
            'fecha_alta' => '2011-02-02',
            'monto' => 220.302,
            "observacion"=> "Falta conseguir maquinas para la cosecha",
            'proposito' => "Se desea armar un taller de apicultura",
            'programaid' => 3,
            'tipo_recursoid' => 3,
            'personaid' => 20,
            'fecha_baja' => null,
            'fecha_acreditacion' => null,
            'descripcion_baja' => null,
            'programa' => 'Emprender',
            'tipo_recurso' => 'Mejora Habitacional',
            'baja' => false,
            'acreditacion' => false,
            'persona' => Array (),
            'alumno_lista' => Array ()
        ]);
        
    }
    
    
    public function crearUnRecursoHabitat(ApiTester $I)
    {        
        $I->wantTo('Se crea un recurso de tipo Hábitat');
        
        $param = [            
            "personaid"=> 16,
            "programaid"=> 5,
            "tipo_recursoid"=> 3,
            "proposito"=> "Se desea mejorar la vivienda del beneficiario",
            "fecha_alta"=> "2018-02-02",
            "monto"=> 220123.302,
            "observacion"=> "La casa del beneficiario fue incendiada"
        ];
        
        $I->sendPOST('/api/recursos',$param);
        $I->seeResponseContainsJson([
            "message"=>"Se guarda una prestacion",
            "success"=>true,
            "data"=>["id"=>75],
            'message' => 'Se guarda una prestacion'
        ]);
        $I->seeResponseCodeIs(200);
        
        $I->sendGET('/api/recursos/75');
        $I->seeResponseContainsJson([
            'id' => 75,
            'fecha_inicial' => date('Y-m-d'),
            'fecha_alta' => "2018-02-02",
            'monto' => 220123.302,
            "observacion"=> "La casa del beneficiario fue incendiada",
            'proposito' => "Se desea mejorar la vivienda del beneficiario",
            'programaid' => 5,
            'tipo_recursoid' => 3,
            'personaid' => 16,
            'fecha_baja' => null,
            'fecha_acreditacion' => null,
            'descripcion_baja' => null,
            'programa' => 'Hábitat',
            'tipo_recurso' => 'Mejora Habitacional',
            'baja' => false,
            'acreditacion' => false,
            'persona' => Array (),
        ]);
        
    }
    
    public function crearUnRecursoMicroEmprendimiento(ApiTester $I)
    {        
        $I->wantTo('Se crea un recurso de tipo MicroEmprendimiento');
        
        $param = [            
            "personaid"=> 25,
            "programaid"=> 4,
            "tipo_recursoid"=> 2,
            "proposito"=> "Se desea emprender una produccion de miel",
            "fecha_alta"=> "2018-02-02",
            "monto"=> 1220123.302,
            "observacion"=> "El apicultor/beneficiario cuenta con muy buena experiencia"
        ];
        
        $I->sendPOST('/api/recursos',$param);
        $I->seeResponseContainsJson([
            "message"=>"Se guarda una prestacion",
            "success"=>true,
            "data"=>["id"=>76],
            'message' => 'Se guarda una prestacion'
        ]);
        $I->seeResponseCodeIs(200);
        
        $I->sendGET('/api/recursos/76');
        $I->seeResponseContainsJson([
            'id' => 76,
            'fecha_inicial' => date('Y-m-d'),
            'fecha_alta' => "2018-02-02",
            'monto' => 1220123.302,
            "observacion"=> "El apicultor/beneficiario cuenta con muy buena experiencia",
            'proposito' => "Se desea emprender una produccion de miel",
            'programaid' => 4,
            'tipo_recursoid' => 2,
            'personaid' => 25,
            'fecha_baja' => null,
            'fecha_acreditacion' => null,
            'descripcion_baja' => null,
            'programa' => 'Micro Emprendimiento',
            'tipo_recurso' => 'Empleo/Formación Laboral',
            'baja' => false,
            'acreditacion' => false,
            'persona' => Array (),
        ]);
        
    }
    
    public function darDeBajaUnRecurso(ApiTester $I)
    {        
        $I->wantTo('Se da de baja un recurso');
        
        $param = [
            "fecha_baja"=>"2018-03-01",
            "descripcion_baja"=>"Se da de baja por falta de fondos"        
        ];
        
        $I->sendPUT('/api/recursos/baja/22',$param);
        $I->seeResponseContainsJson([
            "message"=>"Se da de baja un recurso",
            "success"=>true,
            "data"=>["id"=>22],
        ]);
        $I->seeResponseCodeIs(200);
        
        $I->sendGET('/api/recursos/22');
        $I->seeResponseContainsJson([
            'id' => 22,
            'fecha_inicial' => '2016-01-09',
            'fecha_alta' => '2016-05-17',
            'monto' => 14456,
            'observacion' => 'Observacion Fixture 22',
            'proposito' => 'Un proposito hecho con fixtures 22',
            'programaid' => 3,
            'tipo_recursoid' => 1,
            'personaid' => 2,
            'fecha_baja' => '2018-03-01',
            'fecha_acreditacion' => null,
            'descripcion_baja' => 'Se da de baja por falta de fondos',
            'programa' => 'Emprender',
            'tipo_recurso' => 'Alimentación',
            'baja' => true,
            'acreditacion' => false,
        ]);
        
    }
    
    public function acreditarUnRecurso(ApiTester $I)
    {        
        $I->wantTo('Se acredita un recurso');
        
        $param = [
            "fecha_acreditacion"=>"2018-09-05",  
        ];
        
        $I->sendPUT('/api/recursos/acreditar/60',$param);
        $I->seeResponseContainsJson([
            "message"=>'Se acredita la prestacion',
            "success"=>true,
            "data"=>["id"=>60],
        ]);
        $I->seeResponseCodeIs(200);
        
        $I->sendGET('/api/recursos/60');
        $I->seeResponseContainsJson([
            'id' => 60,
            'fecha_inicial' => '2017-11-11',
            'fecha_alta' => '2018-09-01',
            'monto' => 14456,
            'observacion' => 'Observacion Fixture 60',
            'proposito' => 'Un proposito hecho con fixtures 60',
            'programaid' => 2,
            'tipo_recursoid' => 2,
            'personaid' => 11,
            'fecha_baja' => null,
            'fecha_acreditacion' => '2018-09-05',
            'descripcion_baja' => null,
            'programa' => 'Río Negro Presente',
            'tipo_recurso' => 'Empleo/Formación Laboral',
            'baja' => false,
            'acreditacion' => true,
        ]);
        
    }
    
    public function filtrarRecursosPorRangoDeFechaAlta(ApiTester $I)
    {        
        $I->wantTo('Se filtran recursos por fecha de alta');
        
        $I->sendGET('/api/recursos?fecha_alta_desde=2019-01-03');
        $I->seeResponseContainsJson([
            'pagesize' => 20,
            'pages' => 1,
            'total_filtrado' => 11,
            'monto_acreditado' => 0,
            'monto_baja' => 0,
            'monto_sin_acreditar' => 236185.32999999999,
            'recurso_acreditado_cantidad' => 0,
            'recurso_baja_cantidad' => 0,
            "resultado"=> [
                [
                    "id"=> 61,
                    "fecha_inicial"=> "2017-11-10",
                    "fecha_alta"=> "2019-03-20",
                    "monto"=> 19789.8,
                    "observacion"=> "Observacion Fixture 61",
                    "proposito"=> "Un proposito hecho con fixtures 61",
                    "programaid"=> 3,
                    "tipo_recursoid"=> 3,
                    "personaid"=> 12,
                    "fecha_baja"=> null,
                    "fecha_acreditacion"=> null,
                    "descripcion_baja"=> null,
                    "programa"=> "Emprender",
                    "tipo_recurso"=> "Mejora Habitacional",
                    "baja"=> false,
                    "acreditacion"=> false,
                    "persona"=> [
                        "id"=> 12,
                        "nombre"=> "Sandra Sofía",
                        "apellido"=> "Sosa",
                        "nro_documento"=> "24187541",
                        "cuil"=> "15241875413",
                        "fecha_nacimiento"=> "1980-10-15",
                        "celular"=> "2920412238",
                        "sexoid"=> 2,
                        "nucleoid"=> 12,
                        "estado_civilid"=> 4,
                        "telefono"=> "2920430011",
                        "tipo_documentoid"=> 3,
                        "generoid"=> 2,
                        "email"=> "email22@correo.com",
                        "red_social"=> "redsocial12",
                        "situacion_laboralid"=> 3,
                        "lugar"=> [
                            "id"=> 12,
                            "barrio"=> "barrio3",
                            "calle"=> "calle12",
                            "altura"=> "",
                            "piso"=> "11º",
                            "depto"=> "7",
                            "localidadid"=> 2549,
                            "latitud"=> "-1234112",
                            "longitud"=> "21314135",
                            "escalera"=> "escalera12",
                            "entre_calle_1"=> "Entrecalle12",
                            "entre_calle_2"=> "Entrecalle-92"
                        ]
                    ]
                ],
                [
                    "id"=> 62,
                    "fecha_inicial"=> "2018-03-30",
                    "fecha_alta"=> "2019-03-19",
                    "monto"=> 23123.12,
                    "observacion"=> "Observacion Fixture 62",
                    "proposito"=> "Un proposito hecho con fixtures 62",
                    "programaid"=> 1,
                    "tipo_recursoid"=> 1,
                    "personaid"=> 13,
                    "fecha_baja"=> null,
                    "fecha_acreditacion"=> null,
                    "descripcion_baja"=> null,
                    "programa"=> "Subsidio",
                    "tipo_recurso"=> "Alimentación",
                    "baja"=> false,
                    "acreditacion"=> false,
                    "persona"=> [
                        "id"=> 13,
                        "nombre"=> "Oriana Alejandra",
                        "apellido"=> "Torres",
                        "nro_documento"=> "6078131",
                        "cuil"=> "1560781313",
                        "fecha_nacimiento"=> "1980-10-14",
                        "celular"=> "",
                        "sexoid"=> 2,
                        "nucleoid"=> 13,
                        "estado_civilid"=> 1,
                        "telefono"=> "2920430012",
                        "tipo_documentoid"=> 1,
                        "generoid"=> 2,
                        "email"=> "email22@correo.com",
                        "red_social"=> "redsocial13",
                        "situacion_laboralid"=> 1,
                        "lugar"=> [
                            "id"=> 13,
                            "barrio"=> "barrio4",
                            "calle"=> "calle13",
                            "altura"=> "",
                            "piso"=> "12º",
                            "depto"=> "8",
                            "localidadid"=> 2550,
                            "latitud"=> "-1234111",
                            "longitud"=> "21314136",
                            "escalera"=> "escalera13",
                            "entre_calle_1"=> "Entrecalle13",
                            "entre_calle_2"=> "Entrecalle-91"
                        ]
                    ]
                ],
                [
                    "id"=> 63,
                    "fecha_inicial"=> "2018-03-29",
                    "fecha_alta"=> "2019-03-18",
                    "monto"=> 16789.6,
                    "observacion"=> "Observacion Fixture 63",
                    "proposito"=> "Un proposito hecho con fixtures 63",
                    "programaid"=> 2,
                    "tipo_recursoid"=> 2,
                    "personaid"=> 14,
                    "fecha_baja"=> null,
                    "fecha_acreditacion"=> null,
                    "descripcion_baja"=> null,
                    "programa"=> "Río Negro Presente",
                    "tipo_recurso"=> "Empleo/Formación Laboral",
                    "baja"=> false,
                    "acreditacion"=> false,
                    "persona"=> [
                        "id"=> 14,
                        "nombre"=> "Jessica Daniela",
                        "apellido"=> "Ramírez",
                        "nro_documento"=> "12382584",
                        "cuil"=> "15123825843",
                        "fecha_nacimiento"=> "1980-10-13",
                        "celular"=> "",
                        "sexoid"=> 2,
                        "nucleoid"=> 14,
                        "estado_civilid"=> 2,
                        "telefono"=> "2920430013",
                        "tipo_documentoid"=> 2,
                        "generoid"=> 2,
                        "email"=> "email22@correo.com",
                        "red_social"=> "redsocial14",
                        "situacion_laboralid"=> 2,
                        "lugar"=> [
                            "id"=> 14,
                            "barrio"=> "barrio5",
                            "calle"=> "calle14",
                            "altura"=> "",
                            "piso"=> "13º",
                            "depto"=> "A",
                            "localidadid"=> 2551,
                            "latitud"=> "-1234110",
                            "longitud"=> "21314137",
                            "escalera"=> "escalera14",
                            "entre_calle_1"=> "Entrecalle14",
                            "entre_calle_2"=> "Entrecalle-90"
                        ]
                    ]
                ],
                [
                    "id"=> 64,
                    "fecha_inicial"=> "2018-03-28",
                    "fecha_alta"=> "2019-03-17",
                    "monto"=> 65412,
                    "observacion"=> "Observacion Fixture 64",
                    "proposito"=> "Un proposito hecho con fixtures 64",
                    "programaid"=> 3,
                    "tipo_recursoid"=> 3,
                    "personaid"=> 15,
                    "fecha_baja"=> null,
                    "fecha_acreditacion"=> null,
                    "descripcion_baja"=> null,
                    "programa"=> "Emprender",
                    "tipo_recurso"=> "Mejora Habitacional",
                    "baja"=> false,
                    "acreditacion"=> false,
                    "persona"=> [
                        "id"=> 15,
                        "nombre"=> "Giselle Paola",
                        "apellido"=> "Álvarez",
                        "nro_documento"=> "12057263",
                        "cuil"=> "15120572633",
                        "fecha_nacimiento"=> "1980-10-12",
                        "celular"=> "",
                        "sexoid"=> 2,
                        "nucleoid"=> 15,
                        "estado_civilid"=> 3,
                        "telefono"=> "2920430014",
                        "tipo_documentoid"=> 3,
                        "generoid"=> 2,
                        "email"=> "email22@correo.com",
                        "red_social"=> "redsocial15",
                        "situacion_laboralid"=> 3,
                        "lugar"=> [
                            "id"=> 15,
                            "barrio"=> "barrio6",
                            "calle"=> "calle15",
                            "altura"=> "",
                            "piso"=> "14º",
                            "depto"=> "B",
                            "localidadid"=> 2552,
                            "latitud"=> "-1234109",
                            "longitud"=> "21314138",
                            "escalera"=> "escalera15",
                            "entre_calle_1"=> "Entrecalle15",
                            "entre_calle_2"=> "Entrecalle-89"
                        ]
                    ]
                ],
                [
                    "id"=> 65,
                    "fecha_inicial"=> "2018-03-27",
                    "fecha_alta"=> "2019-03-16",
                    "monto"=> 15000,
                    "observacion"=> "Observacion Fixture 65",
                    "proposito"=> "Un proposito hecho con fixtures 65",
                    "programaid"=> 1,
                    "tipo_recursoid"=> 1,
                    "personaid"=> 16,
                    "fecha_baja"=> null,
                    "fecha_acreditacion"=> null,
                    "descripcion_baja"=> null,
                    "programa"=> "Subsidio",
                    "tipo_recurso"=> "Alimentación",
                    "baja"=> false,
                    "acreditacion"=> false,
                    "persona"=> [
                        "id"=> 16,
                        "nombre"=> "Luisa Estafanía",
                        "apellido"=> "Benítez",
                        "nro_documento"=> "4237616",
                        "cuil"=> "1542376163",
                        "fecha_nacimiento"=> "1980-10-11",
                        "celular"=> "",
                        "sexoid"=> 2,
                        "nucleoid"=> 16,
                        "estado_civilid"=> 4,
                        "telefono"=> "2920430015",
                        "tipo_documentoid"=> 1,
                        "generoid"=> 2,
                        "email"=> "email22@correo.com",
                        "red_social"=> "redsocial16",
                        "situacion_laboralid"=> 1,
                        "lugar"=> [
                            "id"=> 16,
                            "barrio"=> "barrio7",
                            "calle"=> "calle16",
                            "altura"=> "",
                            "piso"=> "15º",
                            "depto"=> "C",
                            "localidadid"=> 2553,
                            "latitud"=> "-1234108",
                            "longitud"=> "21314139",
                            "escalera"=> "escalera16",
                            "entre_calle_1"=> "Entrecalle16",
                            "entre_calle_2"=> "Entrecalle-88"
                        ]
                    ]
                ],
                [
                    "id"=> 66,
                    "fecha_inicial"=> "2018-03-26",
                    "fecha_alta"=> "2019-03-15",
                    "monto"=> 32123.23,
                    "observacion"=> "Observacion Fixture 66",
                    "proposito"=> "Un proposito hecho con fixtures 66",
                    "programaid"=> 2,
                    "tipo_recursoid"=> 2,
                    "personaid"=> 17,
                    "fecha_baja"=> null,
                    "fecha_acreditacion"=> null,
                    "descripcion_baja"=> null,
                    "programa"=> "Río Negro Presente",
                    "tipo_recurso"=> "Empleo/Formación Laboral",
                    "baja"=> false,
                    "acreditacion"=> false,
                    "persona"=> [
                        "id"=> 17,
                        "nombre"=> "Cilia Elena",
                        "apellido"=> "Acosta",
                        "nro_documento"=> "7369661",
                        "cuil"=> "1573696613",
                        "fecha_nacimiento"=> "1980-10-10",
                        "celular"=> "",
                        "sexoid"=> 2,
                        "nucleoid"=> 17,
                        "estado_civilid"=> 1,
                        "telefono"=> "2920430016",
                        "tipo_documentoid"=> 2,
                        "generoid"=> 2,
                        "email"=> "email22@correo.com",
                        "red_social"=> "redsocial17",
                        "situacion_laboralid"=> 2,
                        "lugar"=> [
                            "id"=> 17,
                            "barrio"=> "barrio8",
                            "calle"=> "calle17",
                            "altura"=> "",
                            "piso"=> "16º",
                            "depto"=> "D",
                            "localidadid"=> 2554,
                            "latitud"=> "-1234107",
                            "longitud"=> "21314140",
                            "escalera"=> "escalera17",
                            "entre_calle_1"=> "Entrecalle17",
                            "entre_calle_2"=> "Entrecalle-87"
                        ]
                    ]
                ],
                [
                    "id"=> 67,
                    "fecha_inicial"=> "2018-03-25",
                    "fecha_alta"=> "2019-03-14",
                    "monto"=> 3212.23,
                    "observacion"=> "Observacion Fixture 67",
                    "proposito"=> "Un proposito hecho con fixtures 67",
                    "programaid"=> 3,
                    "tipo_recursoid"=> 3,
                    "personaid"=> 18,
                    "fecha_baja"=> null,
                    "fecha_acreditacion"=> null,
                    "descripcion_baja"=> null,
                    "programa"=> "Emprender",
                    "tipo_recurso"=> "Mejora Habitacional",
                    "baja"=> false,
                    "acreditacion"=> false,
                    "persona"=> [
                        "id"=> 18,
                        "nombre"=> "Dora Josefina",
                        "apellido"=> "Flores",
                        "nro_documento"=> "36850231",
                        "cuil"=> "15368502313",
                        "fecha_nacimiento"=> "1980-10-9",
                        "celular"=> "",
                        "sexoid"=> 2,
                        "nucleoid"=> 18,
                        "estado_civilid"=> 2,
                        "telefono"=> "2920430017",
                        "tipo_documentoid"=> 3,
                        "generoid"=> 2,
                        "email"=> "email22@correo.com",
                        "red_social"=> "redsocial18",
                        "situacion_laboralid"=> 3,
                        "lugar"=> [
                            "id"=> 18,
                            "barrio"=> "barrio9",
                            "calle"=> "calle18",
                            "altura"=> "",
                            "piso"=> "17º",
                            "depto"=> "F",
                            "localidadid"=> 2538,
                            "latitud"=> "-1234106",
                            "longitud"=> "21314141",
                            "escalera"=> "escalera18",
                            "entre_calle_1"=> "Entrecalle18",
                            "entre_calle_2"=> "Entrecalle-86"
                        ]
                    ]
                ],
                [
                    "id"=> 68,
                    "fecha_inicial"=> "2018-03-24",
                    "fecha_alta"=> "2019-03-13",
                    "monto"=> 20000.16,
                    "observacion"=> "Observacion Fixture 68",
                    "proposito"=> "Un proposito hecho con fixtures 68",
                    "programaid"=> 1,
                    "tipo_recursoid"=> 1,
                    "personaid"=> 19,
                    "fecha_baja"=> null,
                    "fecha_acreditacion"=> null,
                    "descripcion_baja"=> null,
                    "programa"=> "Subsidio",
                    "tipo_recurso"=> "Alimentación",
                    "baja"=> false,
                    "acreditacion"=> false,
                    "persona"=> [
                        "id"=> 19,
                        "nombre"=> "Daniela Alessandra",
                        "apellido"=> "Medina",
                        "nro_documento"=> "26958442",
                        "cuil"=> "15269584423",
                        "fecha_nacimiento"=> "1980-10-8",
                        "celular"=> "",
                        "sexoid"=> 2,
                        "nucleoid"=> 19,
                        "estado_civilid"=> 3,
                        "telefono"=> "2920430018",
                        "tipo_documentoid"=> 1,
                        "generoid"=> 2,
                        "email"=> "email22@correo.com",
                        "red_social"=> "redsocial19",
                        "situacion_laboralid"=> 1,
                        "lugar"=> [
                            "id"=> 19,
                            "barrio"=> "barrio1",
                            "calle"=> "calle19",
                            "altura"=> "",
                            "piso"=> "18º",
                            "depto"=> "2",
                            "localidadid"=> 2539,
                            "latitud"=> "-1234105",
                            "longitud"=> "21314142",
                            "escalera"=> "escalera19",
                            "entre_calle_1"=> "Entrecalle19",
                            "entre_calle_2"=> "Entrecalle-85"
                        ]
                    ]
                ],
                [
                    "id"=> 69,
                    "fecha_inicial"=> "2018-03-23",
                    "fecha_alta"=> "2019-03-12",
                    "monto"=> 13245.5,
                    "observacion"=> "Observacion Fixture 69",
                    "proposito"=> "Un proposito hecho con fixtures 69",
                    "programaid"=> 2,
                    "tipo_recursoid"=> 2,
                    "personaid"=> 20,
                    "fecha_baja"=> null,
                    "fecha_acreditacion"=> null,
                    "descripcion_baja"=> null,
                    "programa"=> "Río Negro Presente",
                    "tipo_recurso"=> "Empleo/Formación Laboral",
                    "baja"=> false,
                    "acreditacion"=> false,
                    "persona"=> [
                        "id"=> 20,
                        "nombre"=> "Miranda Daniela",
                        "apellido"=> "Ruiz",
                        "nro_documento"=> "31139343",
                        "cuil"=> "13311393433",
                        "fecha_nacimiento"=> "1980-10-7",
                        "celular"=> "",
                        "sexoid"=> 2,
                        "nucleoid"=> 20,
                        "estado_civilid"=> 4,
                        "telefono"=> "2920430019",
                        "tipo_documentoid"=> 2,
                        "generoid"=> 2,
                        "email"=> "email22@correo.com",
                        "red_social"=> "redsocial20",
                        "situacion_laboralid"=> 2,
                        "lugar"=> [
                            "id"=> 20,
                            "barrio"=> "barrio2",
                            "calle"=> "calle20",
                            "altura"=> "",
                            "piso"=> "19º",
                            "depto"=> "3",
                            "localidadid"=> 2540,
                            "latitud"=> "-1234104",
                            "longitud"=> "21314143",
                            "escalera"=> "escalera20",
                            "entre_calle_1"=> "Entrecalle20",
                            "entre_calle_2"=> "Entrecalle-84"
                        ]
                    ]
                ],
                [
                    "id"=> 70,
                    "fecha_inicial"=> "2018-03-22",
                    "fecha_alta"=> "2019-03-11",
                    "monto"=> 9365.99,
                    "observacion"=> "Observacion Fixture 70",
                    "proposito"=> "Un proposito hecho con fixtures 70",
                    "programaid"=> 3,
                    "tipo_recursoid"=> 3,
                    "personaid"=> 21,
                    "fecha_baja"=> null,
                    "fecha_acreditacion"=> null,
                    "descripcion_baja"=> null,
                    "programa"=> "Emprender",
                    "tipo_recurso"=> "Mejora Habitacional",
                    "baja"=> false,
                    "acreditacion"=> false
                ],
                [
                    "id"=> 71,
                    "fecha_inicial"=> "2018-03-21",
                    "fecha_alta"=> "2019-03-10",
                    "monto"=> 18123.7,
                    "observacion"=> "Observacion Fixture 71",
                    "proposito"=> "Un proposito hecho con fixtures 71",
                    "programaid"=> 1,
                    "tipo_recursoid"=> 2,
                    "personaid"=> 22,
                    "fecha_baja"=> null,
                    "fecha_acreditacion"=> null,
                    "descripcion_baja"=> null,
                    "programa"=> "Subsidio",
                    "tipo_recurso"=> "Empleo/Formación Laboral",
                    "baja"=> false,
                    "acreditacion"=> false
                ]
            ]
        ]);
        $I->seeResponseCodeIs(200);     
        
    }
    public function filtrarRecursosDeBaja(ApiTester $I)
    {        
        $I->wantTo('Se filtran recursos que fueron dados de baja');
        
        $I->sendGET('/api/recursos?baja=TRUE');
        $I->seeResponseContainsJson([            
            "pagesize"=> 20,
            "pages"=> 2,
            "total_filtrado"=> 27,
            "monto_acreditado"=> 0,
            "monto_baja"=> 543897.16,
            "monto_sin_acreditar"=> 0,
            "recurso_acreditado_cantidad"=> 0,
            "recurso_baja_cantidad"=> 27,
            "resultado"=> [
                [
                    "id"=> 39,
                    "fecha_inicial"=> "2017-12-02",
                    "fecha_alta"=> "2018-05-12",
                    "monto"=> 16456.9,
                    "observacion"=> "Observacion Fixture 39",
                    "proposito"=> "Un proposito hecho con fixtures 39",
                    "programaid"=> 2,
                    "tipo_recursoid"=> 1,
                    "personaid"=> 13,
                    "fecha_baja"=> "2018-01-15",
                    "fecha_acreditacion"=> null,
                    "descripcion_baja"=> null,
                    "programa"=> "Río Negro Presente",
                    "tipo_recurso"=> "Alimentación",
                    "baja"=> true,
                    "acreditacion"=> false,
                    "persona"=> [
                        "id"=> 13,
                        "nombre"=> "Oriana Alejandra",
                        "apellido"=> "Torres",
                        "nro_documento"=> "6078131",
                        "cuil"=> "1560781313",
                        "fecha_nacimiento"=> "1980-10-14",
                        "celular"=> "",
                        "sexoid"=> 2,
                        "nucleoid"=> 13,
                        "estado_civilid"=> 1,
                        "telefono"=> "2920430012",
                        "tipo_documentoid"=> 1,
                        "generoid"=> 2,
                        "email"=> "email22@correo.com",
                        "red_social"=> "redsocial13",
                        "situacion_laboralid"=> 1,
                        "lugar"=> [
                            "id"=> 13,
                            "barrio"=> "barrio4",
                            "calle"=> "calle13",
                            "altura"=> "",
                            "piso"=> "12º",
                            "depto"=> "8",
                            "localidadid"=> 2550,
                            "latitud"=> "-1234111",
                            "longitud"=> "21314136",
                            "escalera"=> "escalera13",
                            "entre_calle_1"=> "Entrecalle13",
                            "entre_calle_2"=> "Entrecalle-91"
                        ]
                    ]
                ],
                [
                    "id"=> 40,
                    "fecha_inicial"=> "2017-12-01",
                    "fecha_alta"=> "2018-05-11",
                    "monto"=> 15789.64,
                    "observacion"=> "Observacion Fixture 40",
                    "proposito"=> "Un proposito hecho con fixtures 40",
                    "programaid"=> 3,
                    "tipo_recursoid"=> 2,
                    "personaid"=> 14,
                    "fecha_baja"=> "2018-01-14",
                    "fecha_acreditacion"=> "2018-05-14",
                    "descripcion_baja"=> null,
                    "programa"=> "Emprender",
                    "tipo_recurso"=> "Empleo/Formación Laboral",
                    "baja"=> true,
                    "acreditacion"=> true,
                    "persona"=> [
                        "id"=> 14,
                        "nombre"=> "Jessica Daniela",
                        "apellido"=> "Ramírez",
                        "nro_documento"=> "12382584",
                        "cuil"=> "15123825843",
                        "fecha_nacimiento"=> "1980-10-13",
                        "celular"=> "",
                        "sexoid"=> 2,
                        "nucleoid"=> 14,
                        "estado_civilid"=> 2,
                        "telefono"=> "2920430013",
                        "tipo_documentoid"=> 2,
                        "generoid"=> 2,
                        "email"=> "email22@correo.com",
                        "red_social"=> "redsocial14",
                        "situacion_laboralid"=> 2,
                        "lugar"=> [
                            "id"=> 14,
                            "barrio"=> "barrio5",
                            "calle"=> "calle14",
                            "altura"=> "",
                            "piso"=> "13º",
                            "depto"=> "A",
                            "localidadid"=> 2551,
                            "latitud"=> "-1234110",
                            "longitud"=> "21314137",
                            "escalera"=> "escalera14",
                            "entre_calle_1"=> "Entrecalle14",
                            "entre_calle_2"=> "Entrecalle-90"
                        ]
                    ]
                ],
                [
                    "id"=> 41,
                    "fecha_inicial"=> "2017-11-30",
                    "fecha_alta"=> "2018-05-10",
                    "monto"=> 14456,
                    "observacion"=> "Observacion Fixture 41",
                    "proposito"=> "Un proposito hecho con fixtures 41",
                    "programaid"=> 1,
                    "tipo_recursoid"=> 3,
                    "personaid"=> 15,
                    "fecha_baja"=> "2018-01-13",
                    "fecha_acreditacion"=> "2018-05-13",
                    "descripcion_baja"=> null,
                    "programa"=> "Subsidio",
                    "tipo_recurso"=> "Mejora Habitacional",
                    "baja"=> true,
                    "acreditacion"=> true,
                    "persona"=> [
                        "id"=> 15,
                        "nombre"=> "Giselle Paola",
                        "apellido"=> "Álvarez",
                        "nro_documento"=> "12057263",
                        "cuil"=> "15120572633",
                        "fecha_nacimiento"=> "1980-10-12",
                        "celular"=> "",
                        "sexoid"=> 2,
                        "nucleoid"=> 15,
                        "estado_civilid"=> 3,
                        "telefono"=> "2920430014",
                        "tipo_documentoid"=> 3,
                        "generoid"=> 2,
                        "email"=> "email22@correo.com",
                        "red_social"=> "redsocial15",
                        "situacion_laboralid"=> 3,
                        "lugar"=> [
                            "id"=> 15,
                            "barrio"=> "barrio6",
                            "calle"=> "calle15",
                            "altura"=> "",
                            "piso"=> "14º",
                            "depto"=> "B",
                            "localidadid"=> 2552,
                            "latitud"=> "-1234109",
                            "longitud"=> "21314138",
                            "escalera"=> "escalera15",
                            "entre_calle_1"=> "Entrecalle15",
                            "entre_calle_2"=> "Entrecalle-89"
                        ]
                    ]
                ],
                [
                    "id"=> 42,
                    "fecha_inicial"=> "2017-11-29",
                    "fecha_alta"=> "2018-05-09",
                    "monto"=> 19789.8,
                    "observacion"=> "Observacion Fixture 42",
                    "proposito"=> "Un proposito hecho con fixtures 42",
                    "programaid"=> 2,
                    "tipo_recursoid"=> 1,
                    "personaid"=> 16,
                    "fecha_baja"=> "2018-01-12",
                    "fecha_acreditacion"=> "2018-05-12",
                    "descripcion_baja"=> null,
                    "programa"=> "Río Negro Presente",
                    "tipo_recurso"=> "Alimentación",
                    "baja"=> true,
                    "acreditacion"=> true,
                    "persona"=> [
                        "id"=> 16,
                        "nombre"=> "Luisa Estafanía",
                        "apellido"=> "Benítez",
                        "nro_documento"=> "4237616",
                        "cuil"=> "1542376163",
                        "fecha_nacimiento"=> "1980-10-11",
                        "celular"=> "",
                        "sexoid"=> 2,
                        "nucleoid"=> 16,
                        "estado_civilid"=> 4,
                        "telefono"=> "2920430015",
                        "tipo_documentoid"=> 1,
                        "generoid"=> 2,
                        "email"=> "email22@correo.com",
                        "red_social"=> "redsocial16",
                        "situacion_laboralid"=> 1,
                        "lugar"=> [
                            "id"=> 16,
                            "barrio"=> "barrio7",
                            "calle"=> "calle16",
                            "altura"=> "",
                            "piso"=> "15º",
                            "depto"=> "C",
                            "localidadid"=> 2553,
                            "latitud"=> "-1234108",
                            "longitud"=> "21314139",
                            "escalera"=> "escalera16",
                            "entre_calle_1"=> "Entrecalle16",
                            "entre_calle_2"=> "Entrecalle-88"
                        ],
                    ],
                ],
            ],
        ]);
        $I->seeResponseCodeIs(200);     
        
    }
    public function seVisualizaUnRecursoDeTipoEmprendiemiento(ApiTester $I)
    {        
        $I->wantTo('Se visualiza un recurso de tipo emprendimiento');
        
        $I->sendGET('/api/recursos/61');
        $I->seeResponseContainsJson([
            "id"=> 61,
            "fecha_inicial"=> "2017-11-10",
            "fecha_alta"=> "2019-03-20",
            "monto"=> 19789.8,
            "observacion"=> "Observacion Fixture 61",
            "proposito"=> "Un proposito hecho con fixtures 61",
            "programaid"=> 3,
            "tipo_recursoid"=> 3,
            "personaid"=> 12,
            "fecha_baja"=> null,
            "fecha_acreditacion"=> null,
            "descripcion_baja"=> null,
            "programa"=> "Emprender",
            "tipo_recurso"=> "Mejora Habitacional",
            "baja"=> false,
            "acreditacion"=> false,
            "persona"=> [
                "id"=> 12,
                "nombre"=> "Sandra Sofía",
                "apellido"=> "Sosa",
                "nro_documento"=> "24187541",
                "cuil"=> "15241875413",
                "fecha_nacimiento"=> "1980-10-15",
                "celular"=> "2920412238",
                "sexoid"=> 2,
                "nucleoid"=> 12,
                "estado_civilid"=> 4,
                "telefono"=> "2920430011",
                "tipo_documentoid"=> 3,
                "generoid"=> 2,
                "email"=> "email22@correo.com",
                "red_social"=> "redsocial12",
                "situacion_laboralid"=> 3,
                "lugar"=> [
                    "id"=> 12,
                    "barrio"=> "barrio3",
                    "calle"=> "calle12",
                    "altura"=> "",
                    "piso"=> "11º",
                    "depto"=> "7",
                    "localidadid"=> 2549,
                    "latitud"=> "-1234112",
                    "longitud"=> "21314135",
                    "escalera"=> "escalera12",
                    "entre_calle_1"=> "Entrecalle12",
                    "entre_calle_2"=> "Entrecalle-92"
                ]
            ],
            "alumno_lista"=> [
                [
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
                ],
                
                [
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
                ],
            ],
        ]);
        $I->seeResponseCodeIs(200);     
        
    }
}
