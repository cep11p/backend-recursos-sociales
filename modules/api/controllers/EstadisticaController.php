<?php
namespace app\modules\api\controllers;

use yii\rest\ActiveController;
use yii\web\Response;

use Yii;
use yii\base\Exception;

use app\models\Programa;

class EstadisticaController extends ActiveController{
    
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
                    'roles' => ['usuario'],
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
     * Se obtienen la cantidad de beneficiarios que hay en una localidad, clasificados por los programas
     * @param int $localidadid
     * @return array
     */
    public function actionBeneficiariosPorProgramaEnLocalidad($localidadid) 
    {
        $searchModel = new \app\models\EstadisticaSearch();
        $resultado = $searchModel->beneficiariosPorProgramaEnLocalidad($localidadid);

        return $resultado;
    }
    
    /**
     * Se obtienen la cantidad de modulos alimentarios por localidad
     * @param int $localidadid
     * @return array
     */
    public function actionModuloAlimentarioPorLocalidad() 
    {
        $searchModel = new \app\models\EstadisticaSearch();
        $resultado = $searchModel->moduloAlimentarioPorLocalidad();

        return $resultado;
    }
    
    /**
     * Se obtienen la cantidad de beneficiarios que hay en una localidad, clasificados por los tipos de recursos
     * @param int $localidadid
     * @return array
     */
    public function actionBeneficiariosPorTipoRecursoEnLocalidad($localidadid) 
    {
        $searchModel = new \app\models\EstadisticaSearch();
        $resultado = $searchModel->beneficiariosPorTipoRecursoEnLocalidad($localidadid);

        return $resultado;
    }
    
    /**
     * Se obtienen tipos de montos(acreditado, sin acreditar, baja) clasificados por localidades con orden descendente de monto
     * @param int $rango rango de localidades
     * @return array
     */
    public function actionMontosPorLocalidades($rango) 
    {
        $searchModel = new \app\models\EstadisticaSearch();
        $resultado = $searchModel->montosPorLocalidades($rango);

        return $resultado;
    }
    
}