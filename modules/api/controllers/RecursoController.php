<?php
namespace app\modules\api\controllers;

use yii\rest\ActiveController;
use yii\web\Response;

use Yii;
use yii\base\Exception;

use app\models\Recurso;
use app\models\Aula;

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Writer\Pdf;

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
            'only' => ['index', 'view', 'create','baja','acreditar','exportar-prestaciones-xls'],
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
                ],
                [
                    'allow' => true,
                    'actions' => ['exportar-prestaciones-xls'],
                    'roles' => ['consultar_prestacion'],
                ],
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
            $resultado['persona'] = $model->getPersona();
            
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
    
    public function actionExportarPrestacionesXls()
    {
        $resultado['message']='Se exportan todas la prestaciones';
        $transaction = Yii::$app->db->beginTransaction();
        
        try{
            $searchModel = new \app\models\RecursoSearch();
            $params = \Yii::$app->request->queryParams;
            $resultado = $searchModel->busquedadGeneral($params);
            
//            print_r($resultado);
//            die();
            
            $spreadsheet = new Spreadsheet();
            $sheet = $spreadsheet->getActiveSheet();
            
            /**** Cabecera de Persona*****/
            $sheet->setCellValue('A1', 'Nro Documento');
            $sheet->setCellValue('B1', 'Apellido y Nombre');
            $sheet->setCellValue('C1', 'Localidad');
            $sheet->setCellValue('D1', 'Dirección');
            $sheet->setCellValue('E1', 'Contacto');
            
            /**** Cabecera de Prestacion*****/
            $sheet->setCellValue('F1', 'Programa');
            $sheet->setCellValue('G1', 'Tipo Recurso');
            $sheet->setCellValue('H1', 'Fecha Alta');
            $sheet->setCellValue('I1', 'Monto');
            $sheet->setCellValue('J1', 'Proposito');
            $sheet->setCellValue('K1', 'Observacion');
            $sheet->setCellValue('L1', 'Estado');
            
            /**** Contenido ****/
            $fila = 2;
            foreach ($resultado['resultado'] as $value) {
                
                /***** Registros de Persona *****/
                $sheet->setCellValue('A'.$fila, $value['persona']['nro_documento']);
                $sheet->setCellValue('B'.$fila, $value['persona']['apellido'].', '.$value['persona']['nombre']);
                $sheet->setCellValue('C'.$fila, $value['persona']['lugar']['localidad']);
                $sheet->setCellValue('D'.$fila, \app\components\Help::componerDireccion($value['persona']['lugar']));
                $sheet->setCellValue('E'.$fila, \app\components\Help::componerContacto($value['persona']));
                
                /***** Registros de Prestacion *****/
                $sheet->setCellValue('F'.$fila, $value['programa']);
                $sheet->setCellValue('G'.$fila, $value['tipo_recurso']);
                $sheet->setCellValue('H'.$fila, $value['fecha_alta']);
                $sheet->setCellValue('I'.$fila, '$'.$value['monto']);
                $sheet->setCellValue('J'.$fila, $value['proposito']);
                $sheet->setCellValue('L'.$fila, \app\components\Help::componerEstadoPrestacion($value));
                
                $fila++;
            }
            $fila = $fila+2;
            $sheet->setCellValue('J'.$fila, 'Monto acreditado: $'.$resultado['monto_acreditado']);
            $sheet->setCellValue('K'.$fila, 'Monto sin acreditar: $'.$resultado['monto_sin_acreditar']);
            
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment;filename="prestaciones.xls"');
            header('Cache-Control: max-age=0');
            $writer = new Xlsx($spreadsheet);
//            $writer = \PhpOffice\PhpSpreadsheet\IOFactory::createWriter($spreadsheet, 'Mpdf');

            $writer->save('php://output');
            exit();
        }catch (Exception $exc) {
            $transaction->rollBack();
            $mensaje =$exc->getMessage();
            throw new \yii\web\HttpException(400, $mensaje);
        }

    }
    
//    public function actionExportarPrestacionesPdf()
//    {
//        $resultado['message']='Se exportan todas la prestaciones';
//        $transaction = Yii::$app->db->beginTransaction();
//        
//        try{
//            
//
//            $spreadsheet = new Spreadsheet();
//            $sheet = $spreadsheet->getActiveSheet();
//            $sheet->setCellValue('A1', 'Hello World !');
//            
//            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
//            header('Content-Disposition: attachment;filename="hola.pdf"');
//            header('Cache-Control: max-age=0');
//            
//            $writer = \PhpOffice\PhpSpreadsheet\IOFactory::createWriter($spreadsheet, 'Mpdf');
//            
//            $writer->save('php://output');
//            exit();
//        }catch (Exception $exc) {
//            $transaction->rollBack();
//            $mensaje =$exc->getMessage();
//            throw new \yii\web\HttpException(400, $mensaje);
//        }
//
//    }
    
}