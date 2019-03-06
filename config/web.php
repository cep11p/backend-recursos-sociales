<?php

$params = require __DIR__ . '/params.php';
$db = require __DIR__ . '/db.php';

$config = [
    'id' => 'basic',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'aliases' => [
        '@bower' => '@vendor/bower-asset',
        '@npm'   => '@vendor/npm-asset',
    ],
    'language'=>'es',
    'components' => [
        'request' => [
            // !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => 'XyoomMOzhOl2E11giRy83AMunPVLfehc',
            'parsers' => [
                'application/json' => 'yii\web\JsonParser',
            ]
        ],
        
        'registral'=> [
            'class' => $params['servicioRegistral'],//'app\components\ServicioRegistral'
        ],
        'lugar'=> [
            'class' => $params['servicioLugar'],//'app\components\ServicioLugar'
        ],
        
        'i18n' => [
            'translations' => [
                '*' => [
                    'class' => 'yii\i18n\PhpMessageSource',
                    'basePath' => '@app/messages', // if advanced application, set @frontend/messages
                    'sourceLanguage' => 'es_ES',
                    'fileMap' => [
                        //'main' => 'main.php',
                    ],
                ],
            ],
            
        ],
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        'user' => [
            'identityClass' => 'app\models\User',
            'enableAutoLogin' => true,
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            // send all mails to a file by default. You have to set
            // 'useFileTransport' to false and configure a transport
            // for the mailer to send real emails.
            'useFileTransport' => true,
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'db' => $db,
        
        'urlManager' => [
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'enableStrictParsing' => false,
            'rules' => [
                
                ##### Backend #####
                [   #Programa
                    'class' => 'yii\rest\UrlRule',
                    'controller' => 'backend/programa', 
                ],
                [   #Tipo Recurso
                    'class' => 'yii\rest\UrlRule',
                    'controller' => 'backend/tipo-recurso', 
                ],
                [   #Tipo Recurso Has Programa
                    'class' => 'yii\rest\UrlRule',
                    'controller' => 'backend/programa-has-tipo-recurso', 
                ],
                
                ##### APIREST #####
                [   #Recurso Social
                    'class' => 'yii\rest\UrlRule',
                    'controller' => 'api/recurso', 
                    'extraPatterns' => [
                        'PUT baja/{id}' => 'baja',
                        'OPTIONS baja/{id}' => 'baja',
                        'PUT acreditar/{id}' => 'acreditar',
                        'OPTIONS acreditar/{id}' => 'acreditar',
                    ], 
                ],
                [   #beneficiario
                    'class' => 'yii\rest\UrlRule',
                    'controller' => 'api/beneficiario', 
                ],
                [   #Programa
                    'class' => 'yii\rest\UrlRule',
                    'controller' => 'api/programa', 
                ],
                [   #Tipo Recurso
                    'class' => 'yii\rest\UrlRule',
                    'controller' => 'api/tipo-recurso', 
                ],
                
                ##### Interoperabilidad con Registral #####
                [   #persona
                    'class' => 'yii\rest\UrlRule',
                    'controller' => 'api/persona', 
                ],
                [   #sexo
                    'class' => 'yii\rest\UrlRule',
                    'controller' => 'api/sexo', 
                ],
                [   #genero
                    'class' => 'yii\rest\UrlRule',
                    'controller' => 'api/genero', 
                ],
                [   #estado-civil
                    'class' => 'yii\rest\UrlRule',
                    'controller' => 'api/estado-civil', 
                ],
                
                ##### Interoperabilidad con Lugar#####
                [   #Localidad
                    'class' => 'yii\rest\UrlRule',
                    'controller' => 'api/localidad', 
                ],
            ],
        ],
        
    ],
    'params' => $params,
    
    'modules' => [
//        'user' => [
//            'class' => 'dektrium\user\Module',
//            'enableConfirmation'=>false,
//            'admins'=>['admin']
//        ],
//        'rbac' => 'dektrium\rbac\RbacWebModule',
        
        "audit"=>[
            "class"=>"bedezign\yii2\audit\Audit",
            "ignoreActions" =>['audit/*', 'debug/*'],
            'accessIps'=>null,
            'accessUsers'=>null,
            'accessRoles'=>null
        ],
        
        'api' => [
            'class' => 'app\modules\api\Api',
        ],
        
        'backend' => [
            'class' => 'app\modules\backend\Backend',
        ],
    ],
];

if (YII_ENV_DEV) {
    // configuration adjustments for 'dev' environment
    $config['bootstrap'][] = 'debug';
    $config['modules']['debug'] = [
        'class' => 'yii\debug\Module',
        // uncomment the following to add your IP if you are not connecting from localhost.
        //'allowedIPs' => ['127.0.0.1', '::1'],
    ];

    $config['bootstrap'][] = 'gii';
    $config['modules']['gii'] = [
        'class' => 'yii\gii\Module',
        'allowedIPs' => ['*'],
        // uncomment the following to add your IP if you are not connecting from localhost.
        //'allowedIPs' => ['127.0.0.1', '::1'],
    ];
}

return $config;
