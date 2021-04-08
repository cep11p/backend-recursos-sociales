<?php
namespace app\modules\api\controllers;
use app\models\Cuota;
use DateTime;
use yii\rest\ActiveController;
use yii\web\Response;


class CuotaController extends ActiveController{
    
    public $modelClass = 'app\models\Cuota';
    
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
                    'roles' => ['soporte'],
                ],
            ]
        ];



        return $behaviors;
    }
    
    public function actions()
    {
        $actions = parent::actions();
        unset($actions['delete']);
        unset($actions['view']);
        unset($actions['create']);
        unset($actions['update']);
        return $actions;
    
    }
    
    /**
     * Se Listan todos los roles
     * @return array()
     */
    public function actionDelete($id)
    {
        $resultado['message']='Se borra la cuota con el id '.$id;
        $model = Cuota::findOne(['id'=>$id]);            
        if($model==NULL){
            throw new \yii\web\HttpException(400, 'La cuota con el id '.$id.' no existe!');
        }

        if(time() > strtotime('+24 hour', DateTime::createFromFormat('Y-m-d H:i:s', $model->create_at)->getTimestamp())){
            throw new \yii\web\HttpException(400, 'Despues de 24hs la cuota no se puede borrar!');
        }

        $model->delete();
        
        return $resultado;

    }
    
    
    
}