<?php
namespace app\modules\api\controllers;

use yii\rest\ActiveController;
use yii\web\Response;

use Yii;
use yii\base\Exception;


class TipoResponsableController extends ActiveController{
    
    public $modelClass = 'app\models\TipoResponsable';
    
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
            'only' => ['index'],
            'rules' => [
                [
                    'allow' => true,
                    'actions' => ['index'],
                    'roles' => ['consultar_persona'],
                ],
            ]
        ];



        return $behaviors;
    }
    
    public function actions()
    {
        $actions = parent::actions();
        unset($actions['view']);
        unset($actions['create']);
        unset($actions['update']);
        $actions['index']['prepareDataProvider'] = [$this, 'prepareDataProvider'];
        return $actions;
    }
    
    public function prepareDataProvider() 
    {
        $searchModel = new \app\models\TipoResponsableSearch();
        $params = \Yii::$app->request->queryParams;
        $resultado = $searchModel->busquedaGeneral($params);
        return $resultado;
    }
    
}