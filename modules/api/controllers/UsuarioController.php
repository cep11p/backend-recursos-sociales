<?php

namespace app\modules\api\controllers;

use yii\rest\ActiveController;
use Yii;
use yii\web\Response;
use dektrium\user\Finder;
use dektrium\user\helpers\Password;
use dektrium\user\Module;


class UsuarioController extends ActiveController
{
    public $modelClass = 'app\models\User';
    
    /** @var Finder */
    protected $finder;

    /**
     * @param string $id
     * @param Module $module
     * @param Finder $finder
     * @param array  $config
     */
    public function __construct($id, $module, Finder $finder, $config = [])
    {
        $this->finder = $finder;
        parent::__construct($id, $module, $config);
    }
    
    
    public function behaviors()
    {
        return [
            [
                'class' => 'yii\filters\ContentNegotiator',
                'formats' => [
                    'application/json' => Response::FORMAT_JSON,
                ],
                'languages' => [
                    'es',
                ],      
            ],
            'corsFilter' => [
                'class' => \yii\filters\Cors::className()

            ]
        ];
        
        
    }
    
        /**
     * Login action.
     *
     * @return Response|string
     */
    public function actionLogin()
    {
        $parametros = Yii::$app->getRequest()->getBodyParams();

        $usuario = $this->finder->findUserByUsernameOrEmail($parametros['username']);       
        
        if(!($usuario !== null && Password::validate($parametros['password_hash'],$usuario->password_hash))){
            throw new \yii\web\HttpException(401, 'usuario o contraseña inválido');
        }
        
        $payload = [
            'exp'=>time()+3600*8,
            'usuario'=>$usuario->username,
            'uid' => $usuario->id  
        ];
        
        $token = \Firebase\JWT\JWT::encode($payload, \Yii::$app->params['JWT_SECRET']);

        return [
            'access_token' => $token,
            'username' => $usuario->username
        ];
    }

    
    
    
}
