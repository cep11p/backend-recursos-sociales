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
}
