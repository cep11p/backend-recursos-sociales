<?php

namespace app\modules\backend\controllers;
use yii\filters\AccessControl;
/**
* This is the class for controller "ProgramaController".
*/
class ProgramaController extends \app\modules\backend\controllers\base\ProgramaController
{
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['usuario_soporte'],
                    ],
                ],
            ],
        ];
    }
    
    public function actions() {
        $actions = parent::actions();
        unset($actions['delete']);
        return $actions;
    }
    
    public function actionDelete($id) {
        $model = \app\models\Programa::findOne(['id'=>$id]);
        
        
        if($model==NULL){
            \Yii::$app->session->setFlash('error','El programa a borrar es incorrecta!!');
        }
        
        if(count($model->recursos)>0){
            \Yii::$app->session->setFlash('error','No se pudo borrar el Programa. La misma tiene vínculo con algunas Prestaciones!!');
        }else{
            $model->delete(); 
        }
        
        
        
        return $this->redirect(['/backend/programas']);
    }
}
