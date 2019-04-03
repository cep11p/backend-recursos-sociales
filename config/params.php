<?php

return [
    'adminEmail' => 'admin@example.com',
    'UID_REGISTRAL'=>'2',
    'USUARIO_REGISTRAL'=>'recursosocial',
    'JWT_REGISTRAL' => 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c3VhcmlvIjoicmVjdXJzb3NvY2lhbCIsInVpZCI6Mn0.2LF0oaOLlII15QY-BrcLddmnPguc3ATAv4oOynF2WTQ',  
    'JWT_SECRET' => '123456',
    'servicioRegistral'=> getenv('SERVICIO_REGISTRAL')?getenv('SERVICIO_REGISTRAL'):'app\components\DummyServicioRegistral',
    'servicioLugar'=> getenv('SERVICIO_LUGAR')?getenv('SERVICIO_LUGAR'):'app\components\DummyServicioLugar',
];
