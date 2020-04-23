<?php
namespace app\modules\api\controllers;

use yii\rest\ActiveController;
use yii\web\Response;

use Yii;
use yii\base\Exception;

use app\models\Recurso;


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

        $behaviors['authenticator'] = [
            'class' => \yii\filters\auth\HttpBearerAuth::className(),
        ];

        // avoid authentication on CORS-pre-flight requests (HTTP OPTIONS method)
        $behaviors['authenticator']['except'] = ['options'];     

        $behaviors['access'] = [
            'class' => \yii\filters\AccessControl::className(),
            'only' => ['index', 'view', 'create','baja','acreditar'],
            'rules' => [
                [
                    'allow' => true,
                    'actions' => ['index'],
                    'roles' => ['consultar_prestacion'],
                ],
                [
                    'allow' => true,
                    'actions' => ['view'],
                    'roles' => ['consultar_prestacion'],
                ],
                [
                    'allow' => true,
                    'actions' => ['create'],
                    'roles' => ['crear_modificar_prestacion'],
                ],
                [
                    'allow' => true,
                    'actions' => ['baja'],
                    'roles' => ['baja_prestacion'],
                ],
                [
                    'allow' => true,
                    'actions' => ['acreditar'],
                    'roles' => ['acreditar_prestacion'],
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
        $searchModel = new \app\models\RecursoSearch();
        $params = \Yii::$app->request->queryParams;
        $resultado = $searchModel->busquedadGeneral($params);

        return $resultado;
    }  
    
    public function actionCreate()
    {
        $resultado['message']='Se guarda una prestacion';
        $param = Yii::$app->request->post();
        $transaction = Yii::$app->db->beginTransaction();
        $arrayErrors = array();
        try {
       
            $model = new Recurso();
            $model->setAttributesCustom($param);
            
            if(!$model->save()){
                throw new Exception(json_encode($model->getErrors()));
            }
            
            $model->setResponsableEntrega($param);
            
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
    
    public function actionView($id)
    {
        $resultado['message']='Se visualiza una prestacion';
        $transaction = Yii::$app->db->beginTransaction();
        try {
            $model = Recurso::findOne(['id'=>$id]);            
            if($model==NULL){
                $msj = 'El recurso con el id '.$id.' no existe!';
                throw new Exception($msj);
            }
            
            $resultado = $model->toArray();
            $resultado['localidad'] = $model->getLocalidad();
            $resultado['persona'] = $model->getPersona();
            $resultado['responsable_entrega']['responsable'] = $model->getResponsableEntregaNombre();
            $resultado['responsable_entrega']['tipo_responsable'] = ucfirst($model->responsableEntrega->tipoResponsable->nombre);
            
            if(count($model->getAlumnos())!=0){
                $resultado['alumno_lista'] = $model->getAlumnos();
            }
            
            return $resultado;
           
        }catch (Exception $exc) {
            $transaction->rollBack();
            $mensaje =$exc->getMessage();
            throw new \yii\web\HttpException(400, $mensaje);
        }

    }
    
    /**
     * Esta función permite registrar la baja de un recurso social (prestacion)
     * @param int $id
     * @return array
     * @throws \yii\web\HttpException
     * @throws Exception
     */
    public function actionBaja($id)
    {
        $resultado['message']='Se da de baja un recurso';
        $param = Yii::$app->request->post();
        $transaction = Yii::$app->db->beginTransaction();
        try{
            $model = Recurso::findOne(['id'=>$id]);            
            if($model==NULL){
                $msj = 'El recurso con el id '.$id.' no existe!';
                throw new Exception($msj);
            }
            
            $model->setScenario(Recurso::SCENARIO_BAJA);
            $model->setAttributesBaja($param);
            if(!$model->save()){
                throw new Exception(json_encode($model->getErrors()));
            }
            
            $resultado['success']=true;
            $resultado['message']=$resultado['message'];
            $resultado['data']['id']=$model->id;
            
            $transaction->commit();
            
            return $resultado;
           
        }catch (Exception $exc) {
            $transaction->rollBack();
            $mensaje =$exc->getMessage();
            throw new \yii\web\HttpException(400, $mensaje);
        }

    }
    
    public function actionAcreditar($id)
    {
        $resultado['message']='Se acredita la prestacion';
        $param = Yii::$app->request->post();
        $transaction = Yii::$app->db->beginTransaction();
        try{
            
            $model = Recurso::findOne(['id'=>$id]);            
            if($model==NULL){
                $msj = 'El recurso con el id '.$id.' no existe!';
                throw new Exception($msj);
            }
            
            $model->setScenario(Recurso::SCENARIO_ACREDITACION);
            $model->setAttributesAcreditar($param);
            
            if(!$model->save()){
                throw new Exception(json_encode($model->getErrors()));
            }
            
            $resultado['success']=true;
            $resultado['message']=$resultado['message'];
            $resultado['data']['id']=$model->id;
            
            $transaction->commit();
            
            return $resultado;
           
        }catch (Exception $exc) {
            $transaction->rollBack();
            $mensaje =$exc->getMessage();
            throw new \yii\web\HttpException(400, $mensaje);
        }

    }
    
}