<?php

namespace app\models;

use Yii;
use \app\models\base\Aula as BaseAula;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "aula".
 */
class Aula extends BaseAula
{

    public function behaviors()
    {
        return ArrayHelper::merge(
            parent::behaviors(),
            [
                # custom behaviors
            ]
        );
    }

    public function rules()
    {
        return ArrayHelper::merge(
            parent::rules(),
            [
                # custom validation rules
                ['alumnoid', 'existePersonaEnRegistral'],
                ['alumnoid', 'compare','compareValue'=>0,'operator'=>'!=','message' => 'No se pudo registrar la persona correctamente en el Sistema Registral.']
            ]
        );
    }
    
    public function existePersonaEnRegistral(){
        $response = \Yii::$app->registral->buscarPersonaPorId($this->alumnoid);     
        
        if(isset($response['estado']) && $response['estado']!=true){
            $this->addError('id', 'La persona con el id '.$this->alumnoid.' no existe!');
        }
    }
}
