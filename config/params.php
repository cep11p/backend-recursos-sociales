<?php

return [
    'adminEmail' => 'admin@example.com',
    'UID_REGISTRAL'=>'2',
    'USUARIO_REGISTRAL'=>'recursosocial',
    'REGISTRAL_JWT_SECRET' => 'ZqCeBt}531',
    'servicioRegistral'=> getenv('SERVICIO_REGISTRAL')?getenv('SERVICIO_REGISTRAL'):'app\components\DummyServicioRegistral',
    'servicioLugar'=> getenv('SERVICIO_LUGAR')?getenv('SERVICIO_LUGAR'):'app\components\DummyServicioLugar',
    'JWT_SECRET' => 'ZqCeBt}975',
];
