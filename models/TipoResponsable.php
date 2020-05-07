<?php

namespace app\models;

use Yii;
use \app\models\base\TipoResponsable as BaseTipoResponsable;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "tipo_responsable".
 */
class TipoResponsable extends BaseTipoResponsable
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
            ]
        );
    }
    

    public function fields()
    {
        return ArrayHelper::merge(parent::fields(), [
            'nombre'=> function($model){
                return ucfirst($model->nombre);
            }
        ]);        
    }
}
