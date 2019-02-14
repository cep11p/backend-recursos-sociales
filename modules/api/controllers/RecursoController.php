<?php
namespace app\modules\api\controllers;

use yii\rest\ActiveController;
use yii\web\Response;

use Yii;
use yii\base\Exception;

use app\models\Recurso;
use app\models\Aula;

class RecursoController extends ActiveController{
    
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
        unset($actions['create']);
        unset($actions['update']);
        $actions['index']['prepareDataProvider'] = [$this, 'prepareDataProvider'];
        return $actions;
    
    }
    
    public function prepareDataProvider() 
    {
        $searchModel = new \app\models\RecursoSearch();
        $params = \Yii::$app->request->queryParams;
        $resultado = $searchModel->busquedadGeneral($params);

        return $resultado;
    }  
    
    public function actionListaBeneficiario() 
    {
        $searchModel = new \app\models\RecursoSearch();
        $params = \Yii::$app->request->queryParams;
        $resultado = $searchModel->listaBeneficiario($params);
        
        $default_pagesize=20;
        $pagesize=(isset($params['pagesize']))?$params['pagesize']:$default_pagesize;
        $data = array('success'=>false);
        if($resultado->getTotalCount()){
            $paginas = ceil($resultado->totalCount/$pagesize);
                    
            $data['success']='true';            
            $data['pagesize']=$pagesize;            
            $data['pages']=$paginas;            
            $data['total_filtrado']=$resultado->totalCount;
            $data['resultado']=$resultado->models;
        }

        return $data;
    }  
    
    public function actionCreate()
    {
        $resultado['message']='Se guarda un recurso social';
        $param = Yii::$app->request->post();
        $transaction = Yii::$app->db->beginTransaction();
        $arrayErrors = array();
        try {
       
            $model = new Recurso();
            $model->setAttributes($param);
            $model->fecha_inicial = date('Y-m-d');   
            
            if(!$model->save()){
                throw new Exception(json_encode($model->getErrors()));
            }
            
            #### Guardamos coleccion de alumnos si el pregroma es "Emprender" ####
            if(isset($param['alumno_lista']) && (count($param['alumno_lista'])>0) &&  $model->programa->nombre == 'Emprender'){
                $model->vincularAlumnosAEmprender($param);
            }
            
            $transaction->commit();
            
            $resultado['success']=true;
            $resultado['data']['id']=$model->id;
            
            return  $resultado;
           
        }catch (Exception $exc) {
            $transaction->rollBack();
            $mensaje =$exc->getMessage();
            throw new \yii\web\HttpException(400, $mensaje);
        }

    }
    
    public function actionUpdate($id)
    {
        $resultado['message']='Se guarda un recurso social';
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