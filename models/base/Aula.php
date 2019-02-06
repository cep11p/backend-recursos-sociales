<?php
// This class was automatically generated by a giiant build task
// You should not change it manually as it will be overwritten on next build

namespace app\models\base;

use Yii;

/**
 * This is the base-model class for table "aula".
 *
 * @property integer $recursoid
 * @property integer $alumnoid
 *
 * @property \app\models\Recurso $recurso
 * @property string $aliasModel
 */
abstract class Aula extends \yii\db\ActiveRecord
{



    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'aula';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['recursoid', 'alumnoid'], 'required'],
            [['recursoid', 'alumnoid'], 'integer'],
            [['recursoid', 'alumnoid'], 'unique', 'targetAttribute' => ['recursoid', 'alumnoid']],
            [['recursoid'], 'exist', 'skipOnError' => true, 'targetClass' => \app\models\Recurso::className(), 'targetAttribute' => ['recursoid' => 'id']]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'recursoid' => 'Recursoid',
            'alumnoid' => 'Alumnoid',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRecurso()
    {
        return $this->hasOne(\app\models\Recurso::className(), ['id' => 'recursoid']);
    }




}
