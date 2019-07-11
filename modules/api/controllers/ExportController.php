<?php
namespace app\modules\api\controllers;

use yii\rest\ActiveController;
use yii\web\Response;

use Yii;
use yii\base\Exception;

use app\models\Recurso;

use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Writer\Pdf;

class ExportController extends ActiveController{
    
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
            'only' => ['exportar-prestaciones-xls'],
            'rules' => [
                [
                    'allow' => true,
                    'actions' => ['exportar-prestaciones-xls'],
                    'roles' => ['exportar_prestacion'],
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
        unset($actions['index']);
        return $actions;
    
    }
    
    public function actionExportarPrestacionesXls()
    {
//        die("hola contralodor export");
        $resultado['message']='Se exportan todas la prestaciones';
        $transaction = Yii::$app->db->beginTransaction();
        
        try{
            $searchModel = new \app\models\RecursoSearch();
            $params = \Yii::$app->request->queryParams;
            $params['pagesize']=99999;
            $resultado = $searchModel->busquedadGeneral($params);
            
            #cargamos el temprate
            $inputFileName = \Yii::$app->basePath.'/template-export/01template.xls';
            $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load($inputFileName);
            
            $sheet = $spreadsheet->getActiveSheet();
                     
            #Se detalla el total filtrado
            $sheet->setCellValue('L6', 'Total filtrado: '.$resultado['total_filtrado']);
            $sheet->getCell('L6')->getStyle()->getFont()->setBold(true);
            $sheet->getCell('L6')->getStyle()->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_RIGHT);
            
            #Se detalla en negrita el monto acreditado y el monto sin acreditar
            $sheet->setCellValue('I7', 'Monto acreditado: $'.$resultado['monto_acreditado']);            
            $sheet->setCellValue('K7', 'Monto sin acreditar: $'.$resultado['monto_sin_acreditar']);  
            
            #se ponen en negrita el siguiente rango de celdas
            $sheet->getStyle('I7:K7')->getFont()->setBold(true);
            
            #Se unen las celdas
            $sheet->mergeCells('I7:J7');
            $sheet->mergeCells('K7:L7');
            
            #Se alinea el texto
            $sheet->getCell('I7')->getStyle()->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_LEFT);
            $sheet->getCell('K7')->getStyle()->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_RIGHT);
            
            
            /**** Cabecera de Persona*****/
            $cabeceraRow = 9;
            $sheet->setCellValue('A'.$cabeceraRow, 'Nro Documento');
            $sheet->setCellValue('B'.$cabeceraRow, 'Apellido y Nombre');
            $sheet->setCellValue('C'.$cabeceraRow, 'Localidad');
            $sheet->setCellValue('D'.$cabeceraRow, 'Dirección');
            $sheet->setCellValue('E'.$cabeceraRow, 'Contacto');
            
            /**** Cabecera de Prestacion*****/
            $sheet->setCellValue('F'.$cabeceraRow, 'Programa');
            $sheet->setCellValue('G'.$cabeceraRow, 'Tipo Recurso');
            $sheet->setCellValue('H'.$cabeceraRow, 'Fecha Alta');
            $sheet->setCellValue('I'.$cabeceraRow, 'Monto');
            $sheet->setCellValue('J'.$cabeceraRow, 'Propósito');
            $sheet->setCellValue('K'.$cabeceraRow, 'Estado');
            $sheet->setCellValue('L'.$cabeceraRow, 'Observación');
            
            $styleArray = [
                'font' => [
                    'bold' => true,
                ],
                'alignment' => [
                    'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
                ],
            ];
            
            #Se pone en negrita
            $sheet->getStyle('A'.$cabeceraRow.':L'.$cabeceraRow)->applyFromArray($styleArray);
            
            /**** Contenido ****/
            $fila = 10;
            foreach ($resultado['resultado'] as $value) {
                #se alterna el color de fondo de las filas
                if($fila%2==0){
                    $spreadsheet->getActiveSheet()->getStyle('A'.$fila.':L'.$fila)->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)->getStartColor()->setARGB('eeeeee');
                }
                
                /***** Registros de Persona *****/
                $sheet->setCellValue('A'.$fila, $value['persona']['nro_documento']);
                $sheet->setCellValue('B'.$fila, $value['persona']['apellido'].', '.$value['persona']['nombre']);
                $sheet->setCellValue('C'.$fila, $value['persona']['lugar']['localidad']);
                $sheet->setCellValue('D'.$fila, \app\components\Help::componerDireccion($value['persona']['lugar']));
                $sheet->setCellValue('E'.$fila, \app\components\Help::componerContacto($value['persona']));
                
                #Se formatea el tipo de valor a contener
                $sheet->getCell('E'.$fila)->setDataType(\PhpOffice\PhpSpreadsheet\Cell\DataType::TYPE_STRING);
                
                /***** Registros de Prestacion *****/
                $sheet->setCellValue('F'.$fila, $value['programa']);
                $sheet->setCellValue('G'.$fila, $value['tipo_recurso']);
                $sheet->setCellValue('H'.$fila, $value['fecha_alta']);
                $sheet->setCellValue('I'.$fila, '$'.$value['monto']);
                $sheet->setCellValue('J'.$fila, $value['proposito']);
                $sheet->setCellValue('K'.$fila, \app\components\Help::componerEstadoPrestacion($value));
                $sheet->setCellValue('L'.$fila, $value['observacion']);
                
                $fila++;
            }
            
            #Se detalla en negrita el criterio de fecha_desde y fecha_hasta en el documento
            $fila = $fila+2;
            if(isset($params['fecha_desde']) && !empty($params['fecha_desde'])){
                $cadena = 'Fecha desde '.$params['fecha_desde'];
                $cadena .= (isset($params['fecha_hasta']) && !empty($params['fecha_hasta']))?' hasta '.$params['fecha_hasta']:'';
                $sheet->setCellValue('A'.$fila, $cadena);  
                $sheet->getCell('A'.$fila)->getStyle()->getFont()->setBold(true);
            }
            
            #Se prepara la cabecera para exportar el archivo
            header('Access-Control-Allow-Origin: *');
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