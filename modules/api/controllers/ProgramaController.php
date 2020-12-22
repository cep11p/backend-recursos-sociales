<?php
namespace app\modules\api\controllers;

use yii\rest\ActiveController;
use yii\web\Response;

use Yii;
use yii\base\Exception;

use app\models\Programa;

class ProgramaController extends ActiveController{
    
    public $modelClass = 'app\models\Programa';
    
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
        $behaviors['authenticator']['except'] = ['options'];     

        $behaviors['access'] = [
            'class' => \yii\filters\AccessControl::className(),
            'only' => ['index', 'view', 'create','update'],
            'rules' => [
                [
                    'allow' => true,
                    'actions' => ['index'],
                    'roles' => ['prestacion_ver'],
                ],
                [
                    'allow' => true,
                    'actions' => ['view'],
                    'roles' => ['consultar_prestacion'],
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
        unset($actions['delete']);
        unset($actions['index']);
        return $actions;
    
    }
    
    
    /**
     * Se listan los programas con detalles estadisticos. Este listado depende del rol del usuario
     *
     * @return array
     */
    public function actionDetalle() 
    {
        $searchModel = new \app\models\ProgramaSearch();
        $params = \Yii::$app->request->queryParams;
        $resultado = $searchModel->getProgramaDetalle($params);

        return $resultado;
    }

    /**
     * Se listan los programas. Este listado depende del rol del usuario
     *
     * @return array
     */
    public function actionIndex() 
    {
        $searchModel = new \app\models\ProgramaSearch();
        $params = \Yii::$app->request->queryParams;
        $resultado = $searchModel->busquedadGeneral($params);

        return $resultado;
    }
        
}