<?php

namespace app\modules\api\controllers;

use app\models\User;
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
        $behaviors = parent::behaviors();     

        $auth = $behaviors['authenticator'];
        unset($behaviors['authenticator']);

        $behaviors['corsFilter'] = [
            'class' => \yii\filters\Cors::className()
        ];

        $behaviors['contentNegotiator']['formats']['application/json'] = Response::FORMAT_JSON;

        $behaviors['authenticator'] = $auth;

        $behaviors['authenticator'] = [
            'class' => \yii\filters\auth\HttpBearerAuth::className(),
        ];

        // avoid authentication on CORS-pre-flight requests (HTTP OPTIONS method)
        $behaviors['authenticator']['except'] = ['options','login'];     

        $behaviors['access'] = [
            'class' => \yii\filters\AccessControl::className(),
            'rules' => [
                [
                    'allow' => true,
                    'actions' => ['index'],
                    'roles' => ['soporte'],
                ],
                [
                    'allow' => true,
                    'actions' => ['view'],
                    'roles' => ['soporte'],
                ],
                [
                    'allow' => true,
                    'actions' => ['create'],
                    'roles' => ['soporte'],
                ],
                [
                    'allow' => true,
                    'actions' => ['login'],
                    'roles' => ['?'],
                ],
                [
                    'allow' => true,
                    'actions' => ['listar-asignacion'],
                    'roles' => ['soporte'],
                ],
                [
                    'allow' => true,
                    'actions' => ['crear-asignacion'],
                    'roles' => ['soporte'],
                ]
            ]
        ];

        return $behaviors;
    }

    public function actions()
    {
        $actions = parent::actions();
        unset($actions['create']);
        unset($actions['update']);
        unset($actions['view']);
        $actions['index']['prepareDataProvider'] = [$this, 'prepareDataProvider'];
        return $actions;
    
    }

    public function prepareDataProvider() 
    {
        $searchModel = new \app\models\UserSearch();
        $params = \Yii::$app->request->queryParams;
        $resultado = $searchModel->search($params);

        return $resultado;
    }

    public function actionView($id){
        $model = User::findOne(['id'=>$id]);            
        if($model==NULL){
            throw new \yii\web\HttpException(400, 'El usuario con el id '.$id.' no existe!');
        }
        
        $resultado = $model->toArray();
        
        return $resultado;
    }

    public function actionListarAsignacion($id){
        $model = User::findOne(['id'=>$id]);            
        if($model==NULL){
            throw new \yii\web\HttpException(400, 'El usuario con el id '.$id.' no existe!');
        }
        $resultado = $model->getAsignaciones();

        return $resultado;
    }

    public function actionCrearAsignacion(){
        $params = Yii::$app->request->post();
        $resultado['success'] = false;
        if(User::setAsignacion($params)){
            $resultado['success'] = true;
            $resultado['mensaje'] = 'Asignaciones guardadas exitosamente!';
        }

        return $resultado;
    }


    public function actionCreate(){
        $resultado['message']='Se crea un usuario';
        $param = Yii::$app->request->post();

        $transaction = Yii::$app->db->beginTransaction();
        try {
       
            /** @var User $user */
            $user = new User();
            $user->setScenario('create');
            
            $user->setAttributesCustom($param);
            if(!$user->create()){
                throw new \yii\web\HttpException(400,json_encode($user->getErrors()));
            }
            
            $transaction->commit();
            
            $resultado['success']=true;
            $resultado['data']['id']=$user->id;
            
            return  $resultado;
           
        }catch (\yii\web\HttpException $exc) {
            $transaction->rollBack();
            $mensaje =$exc->getMessage();
            $statuCode =$exc->statusCode;
            throw new \yii\web\HttpException($statuCode, $mensaje);
        }
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

        $rol = '';
        $roles = \Yii::$app->authManager->getRolesByUser($usuario->id);
        foreach($roles as $value){
            $rol = $value->name;
            break;
        }
        return [
            'access_token' => $token,
            'username' => $usuario->username,
            'rol' => $rol
        ];
    }

    
}