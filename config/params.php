<?php

return [
    'adminEmail' => 'admin@example.com',
    'servicioRegistral'=> getenv('SERVICIO_REGISTRAL')?getenv('SERVICIO_REGISTRAL'):'app\components\DummyServicioRegistral',
    'JWT_REGISTRAL' => 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c3VhcmlvIjoiYWRtaW4iLCJ1aWQiOjF9.rTItKCAU2xYxW1kiCDwP-e64LK2DG6PAq7FGCs43V5s',
];
