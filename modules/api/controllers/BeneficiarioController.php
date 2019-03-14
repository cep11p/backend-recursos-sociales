<?php
namespace app\modules\api\controllers;

use yii\rest\ActiveController;
use yii\web\Response;

use Yii;
use yii\base\Exception;

use app\models\Recurso;
use app\models\Aula;

class BeneficiarioController extends ActiveController{
    
    public $modelClass = 'app\models\Recurso';
    
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

//        $behaviors['authenticator'] = [
//            'class' => \yii\filters\auth\HttpBearerAuth::className(),
//        ];

        // avoid authentication on CORS-pre-flight requests (HTTP OPTIONS method)
        $behaviors['authenticator']['except'] = ['options'];     

//        $behaviors['access'] = [
//            'class' => \yii\filters\AccessControl::className(),
//            'only' => ['*'],
//            'rules' => [
//                [
//                    'allow' => true,
//                    'roles' => ['@'],
//                ]
//            ]
//        ];



        return $behaviors;
    }
    
    public function actions()
    {
        $actions = parent::actions();
//        unset($actions['create']);
//        unset($actions['update']);
        unset($actions['view']);
        $actions['index']['prepareDataProvider'] = [$this, 'prepareDataProvider'];
        return $actions;
    
    } 
    
    public function prepareDataProvider() 
    {
        $searchModel = new \app\models\RecursoSearch();
        $params = \Yii::$app->request->queryParams;
        $resultado = $searchModel->listaRecursosAgrupadosPorPersona($params);

        return $resultado;
    }  
    
    /**
     * Se muestra a el beneficiario con todas las prestaciones agrupadas por programa
     * @param int $id
     * @return array
     * @throws \yii\web\HttpException
     * @throws Exception
     */
    public function actionView($id)
    {
        try {
            $searchModel = new \app\models\RecursoSearch();
            $resultado = $searchModel->viewBeneficiario(["personaid"=>$id]);
            
            if(count($resultado)==0){
                throw new Exception('No existe ninguna persona con id '.$id);
            }

            return $resultado;
        } catch (Exception $exc) {
            $mensaje =$exc->getMessage();
            throw new \yii\web\HttpException(400, $mensaje);
        }
        
        
        
    }
    
}