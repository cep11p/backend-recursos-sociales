<?php
// This class was automatically generated by a giiant build task
// You should not change it manually as it will be overwritten on next build

namespace app\models\base;

use Yii;

/**
 * This is the base-model class for table "tipo_recurso_has_programa".
 *
 * @property integer $tipo_recursoid
 * @property integer $programaid
 *
 * @property \app\models\Programa $programa
 * @property \app\models\TipoRecurso $tipoRecurso
 * @property string $aliasModel
 */
abstract class TipoRecursoHasPrograma extends \yii\db\ActiveRecord
{



    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tipo_recurso_has_programa';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['tipo_recursoid', 'programaid'], 'required'],
            [['tipo_recursoid', 'programaid'], 'integer'],
            [['tipo_recursoid', 'programaid'], 'unique', 'targetAttribute' => ['tipo_recursoid', 'programaid']],
            [['programaid'], 'exist', 'skipOnError' => true, 'targetClass' => \app\models\Programa::className(), 'targetAttribute' => ['programaid' => 'id']],
            [['tipo_recursoid'], 'exist', 'skipOnError' => true, 'targetClass' => \app\models\TipoRecurso::className(), 'targetAttribute' => ['tipo_recursoid' => 'id']]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'tipo_recursoid' => 'Tipo Recursoid',
            'programaid' => 'Programaid',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPrograma()
    {
        return $this->hasOne(\app\models\Programa::className(), ['id' => 'programaid']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTipoRecurso()
    {
        return $this->hasOne(\app\models\TipoRecurso::className(), ['id' => 'tipo_recursoid']);
    }




}
