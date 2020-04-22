<?php
namespace app\modules\api\controllers;

use yii\rest\ActiveController;
use yii\web\Response;

use Yii;
use yii\base\Exception;

class HerramientaController extends ActiveController{
    
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
        unset($actions['delete']);
        unset($actions['view']);
        return $actions;
    }
    
    public function actionImport(){
        ini_set('memory_limit', '3072M');

        $file = '/persona_array/modulo_alimenticio.php';
        
        /** Importamos archivo php **/
        $data = require(\Yii::getAlias('@app').$file);
        
        /** Se limpia y se unifica el atributo calle **/
        $i=0;
        foreach ($data as $value) {
            $calle = trim($value['persona']['lugar']['calle']);
            $calle = str_replace(' ', '-', $calle);
            $calle = str_replace('--', '-', $calle);
            $calle = preg_replace('/--+/', '-', $calle);
            $calle = str_replace('-', ' ', $calle);
            
            $data[$i]['persona']['lugar']['calle'] = $calle;
            $i++;
        }

        $j=0;
        foreach ($data as $value) {
            
            
            /***** Registro de Persona ******/
            $param = $value['persona'];
            set_time_limit(0);
            $arrayErrors = array();
            try {
                $model = new \app\models\PersonaForm();
                $persona_array = $model->BuscarPersonaPorNroDocumentoEnRegistral($value['persona']['nro_documento']);
                if(count($persona_array)>0){
                    $value['personaid'] = $persona_array['id'];
                    

                }else{
                    $model->setAttributesAndSave($param);
                    $value['personaid'] = $model->id;
                }
            }catch (Exception $exc) {
                $mensaje =$exc->getMessage();
                throw new \yii\web\HttpException(400, $mensaje);
            }
            
            /***** Recurso social *****/
            set_time_limit(0);
            $transaction = Yii::$app->db->beginTransaction();
            $arrayErrors = array();
            try {
                $model = new \app\models\Recurso();
                $model->setAttributesCustom($value);

                if(!$model->save()){
                    throw new Exception(json_encode($model->getErrors()));
                }
                $model->setResponsableEntrega($value);

                #### Guardamos coleccion de alumnos si el pregroma es "Emprender" ####
                if(isset($param['alumno_lista']) && (count($param['alumno_lista'])>0) &&  $model->programa->nombre == 'Emprender'){
                    $model->vincularAlumnosAEmprender($param);
                }

                $transaction->commit();

                $resultado['success']=true;
                $resultado['recurosids'][]=$model->id;

            }catch (Exception $exc) {
                $transaction->rollBack();
                $mensaje =$exc->getMessage();
                throw new \yii\web\HttpException(400, $mensaje);
            }
            
        }
        
        return $resultado;
    }
    
}