<?php

namespace app\modules\backend\controllers;

/**
* This is the class for controller "TipoRecursoController".
*/
class TipoRecursoController extends \app\modules\backend\controllers\base\TipoRecursoController
{
     public function actions() {
        $actions = parent::actions();
        unset($actions['delete']);
        return $actions;
    }
    
    public function actionDelete($id) {
        $model = \app\models\TipoRecurso::findOne(['id'=>$id]);
        
        
        if($model==NULL){
            \Yii::$app->session->setFlash('error','El tipo de recurso a borrar es incorrecta!!');
        }
        
        if(count($model->programas)>0){
            \Yii::$app->session->setFlash('error','No se pudo borrar el Tipo de recurso. La misma tiene vínculo con algunos Programas!!');
        }else{
            $model->delete(); 
        }
        
        
        
        return $this->redirect(['/backend/tipo-recursos']);
    }

}
