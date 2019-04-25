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
            'only' => ['*'],
            'rules' => [
                [
                    'allow' => true,
                    'roles' => ['@'],
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
        $actions['index']['prepareDataProvider'] = [$this, 'prepareDataProvider'];
        return $actions;
    
    }
    
    
    
    public function prepareDataProvider() 
    {
        $searchModel = new \app\models\ProgramaSearch();
        $params = \Yii::$app->request->queryParams;
        $resultado = $searchModel->busquedadGeneral($params);

        return $resultado;
    }
    
    public function actionCreate()
    {
        $resultado['message']='Se guarda un programa';
        $param = Yii::$app->request->post();
        $transaction = Yii::$app->db->beginTransaction();
        $arrayErrors = array();
        try {
       
            die($resultado['message']);
           
        }catch (Exception $exc) {
            $transaction->rollBack();
            $mensaje =$exc->getMessage();
            throw new \yii\web\HttpException(500, $mensaje);
        }

    }
    
    public function actionUpdate($id)
    {
        $resultado['message']='Se guarda un programa';
        $param = Yii::$app->request->post();
        $transaction = Yii::$app->db->beginTransaction();
        $arrayErrors = array();
        try {
       
            die($resultado['message']);
           
        }catch (Exception $exc) {
            $transaction->rollBack();
            $mensaje =$exc->getMessage();
            throw new \yii\web\HttpException(500, $mensaje);
        }

    }
    
}