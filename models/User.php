<?php

namespace app\models;

use dektrium\user\helpers\Password;
use dektrium\user\models\User as ModelsUser;
use yii\db\Query;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "user".
 */
class User extends ModelsUser
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

    public function getProgramasAsociados(){
        $query = new Query();
        
        $query->select([
            'programa'=>'prog.nombre',
            'programaid',
        ]);

        $query->from('programa_has_usuario phu1');
        $query->leftJoin("programa as prog", "programaid=prog.id");
        $query->where(['userid'=>$this->id]);
        $query->groupBy('programa');
        
        $command = $query->createCommand();
        $rows = $command->queryAll();

        return $rows;
    }

    public function getAsignaciones(){
        $lista_programa = $this->getProgramasAsociados();
        // print_r($lista_programa);die();

        $i=0;
        foreach ($lista_programa as $value) {
            $query = new Query();        
            $query->select([
                'permiso'
            ]);
            $query->from('programa_has_usuario');
            $query->where([
                'userid'=>$this->id,
                'programaid'=>$value['programaid']
            ]);
            
            $command = $query->createCommand();
            $rows = $command->queryAll();
            
            $permisos = array();
            foreach ($rows as $value) {
                $permisos[] = $value['permiso'];
            }
            $lista_programa[$i]['lista_permiso'] = $permisos;
            $lista_programa[$i]['usuarioid'] = $this->id;
            $i++;
        }
                
        return $lista_programa;
    }

    public function setAttributesCustom($params)
    {
        $this->setAttributes($params);
        
        if(isset($params['password_hash'])){
            $this->password_hash = Password::hash($params['password_hash']);
        }
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
}
