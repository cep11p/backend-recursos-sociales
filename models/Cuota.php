<?php

namespace app\models;

use Yii;
use \app\models\base\Cuota as BaseCuota;
use DateTime;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "cuota".
 */
class Cuota extends BaseCuota
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
            'borrar'=> function($model){
                return time() < strtotime('+24 hour', DateTime::createFromFormat('Y-m-d H:i:s', $this->create_at)->getTimestamp());
            }
        ]);
        
    }
}
