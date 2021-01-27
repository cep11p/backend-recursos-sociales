<?php
// This class was automatically generated by a giiant build task
// You should not change it manually as it will be overwritten on next build

namespace app\models\base;

use Yii;

/**
 * This is the base-model class for table "user_persona".
 *
 * @property integer $userid
 * @property integer $personaid
 * @property integer $localidadid
 *
 * @property \app\models\User $user
 * @property string $aliasModel
 */
abstract class UserPersona extends \yii\db\ActiveRecord
{



    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'user_persona';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['personaid', 'localidadid'], 'required'],
            [['personaid', 'localidadid'], 'integer'],
            [['userid'], 'exist', 'skipOnError' => true, 'targetClass' => \app\models\User::className(), 'targetAttribute' => ['userid' => 'id']]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'userid' => 'Userid',
            'personaid' => 'Personaid',
            'localidadid' => 'Localidadid',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(\app\models\User::className(), ['id' => 'userid']);
    }




}