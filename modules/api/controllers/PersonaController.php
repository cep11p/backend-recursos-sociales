<?php
namespace app\modules\api\controllers;

use yii\rest\ActiveController;
use yii\web\Response;

use Yii;
use yii\base\Exception;

class PersonaController extends ActiveController{
    
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
        unset($actions['index']);
        return $actions;
    
    }
    
    /**
     * Esta accion permite hacer una interoperabilidad con el sistema registral
     * @return array()
     */
    public function actionIndex()
    {
        $resultado['estado']=false;
        $param = Yii::$app->request->queryParams;
        
        
        $resultado = \Yii::$app->registral->buscarPersona($param);
        
        if($resultado['estado']!=true){
            $data['success']=false;
            $data['total_filtrado']=0;            
            $data['resultado']=[];
            $data['message']="No se encontró ninguna persona!";   
        }else{
            $data['success']=true;            
            $data['total_filtrado']=$resultado['total_filtrado'];
            $data['pages']=$resultado['pages'];
            $data['pagesize']=$resultado['pagesize'];
            $data['resultado']=$resultado['resultado'];
        }
        
        return $data;

    }
    
    public function actionCreate()
    {
        $resultado['message']='Se guarda un beneficiario';
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
        $resultado['message']='Se guarda un beneficiario';
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
    
    /**
     * Se busca una persona por numero documento
     * @param type $nro_documento
     * @Method GET
     * @url ejemplo http://api.pril.local/api/personas/buscar-por-documento/29800100
     * @return array
     */
    public function actionBuscarPorDocumento($nro_documento)
    {
        $resultado['estado']=false;   
        $resultado = \Yii::$app->registral->buscarPersonaPorNroDocumento($nro_documento);
        
        if($resultado['estado']!=true){
            $data['success']=false;            
            $data['resultado']=[];
            $data['message']="No se encontró ninguna persona!";   
        }else{
            $data['success']=true;
            $data['resultado']=$resultado['resultado'];
        }
        
        return $data;

    }
    
}