<?php

namespace app\models;

use dektrium\user\helpers\Password;
use dektrium\user\models\User as ModelsUser;
use Yii;
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

    public static function setAsignacion($params){
        #Validamos que exista el usuario
        if(User::findOne(['id'=>$params['usuarioid']])==NULL){
            throw new \yii\web\HttpException(400, 'El usuario con el id '.$params['usuarioid'].' no existe!');
        }

        $transaction = Yii::$app->db->beginTransaction();
        try {

            #Asignamos los permisos
            foreach ($params['lista_permiso'] as $value) {
                $auth_assignment = new AuthAssignment();
                $auth_assignment->setAttributes(['item_name'=>$value['name'],'user_id'=>strval($params['usuarioid'])]);
                if(!$auth_assignment->save()){
                    throw new \yii\web\HttpException(400, json_encode($auth_assignment->errors));
                }
            }

            #Asociamos el programa (vinculacion de programa, permiso y usuario)
            foreach ($params['lista_permiso'] as $value) {
                $programaHasUsuario = new ProgramaHasUsuario();
                $programaHasUsuario->setAttributes([
                    'userid'=>$params['usuarioid'],
                    'programaid'=>$params['programaid'],
                    'permiso'=>$value['name']
                ]);

                if(!$programaHasUsuario->save()){
                    throw new \yii\web\HttpException(400, json_encode($auth_assignment->errors));
                }
            }
            $transaction->commit();

            return true;
        }catch (\yii\web\HttpException $exc) {
            $transaction->rollBack();
            $mensaje =$exc->getMessage();
            $statuCode =$exc->statusCode;
            throw new \yii\web\HttpException($statuCode, $mensaje);
        }
    }
    

    public function getAsignaciones(){
        $lista_programa = $this->getProgramasAsociados();

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

    /**
     * Borramos los permisos de un usuario
     *
     * @param [array] $params
     * @return void
     */
    public static function borrarAsignaciones($params){
        #Validamos que exista el usuario
        if(User::findOne(['id'=>$params['usuarioid']])==NULL){
            throw new \yii\web\HttpException(400, 'El usuario con el id '.$params['usuarioid'].' no existe!');
        }

        $transaction = Yii::$app->db->beginTransaction();
        try {

            #Borramos los permisos (auth_assigment)
            foreach ($params['lista_permiso'] as $value) {
                AuthAssignment::deleteAll([
                    'user_id'=>$params['usuarioid'],
                    'item_name'=>$value,
                    ]);
            }

            #Borramos la regla (programa_has_usuario)
            foreach ($params['lista_permiso'] as $value) {
                ProgramaHasUsuario::deleteAll([
                    'userid'=>$params['usuarioid'],
                    'programaid'=>$params['programaid'],
                    'permiso'=>$value
                ]);
            }
            $transaction->commit();

            return true;
        }catch (\yii\web\HttpException $exc) {
            $transaction->rollBack();
            $mensaje =$exc->getMessage();
            $statuCode =$exc->statusCode;
            throw new \yii\web\HttpException($statuCode, $mensaje);
        }
    }

    public function setAttributesCustom($params)
    {
        $this->setAttributes($params);
        
        if(isset($params['password_hash'])){
            $this->password_hash = Password::hash($params['password_hash']);
        }

        ######### Asignamos el Rol ###########
        //Si el usuario tiene rol borramos y dsp lo recreamos
        // if(AuthAssignment::findOne(['user_id'=>$params['usuarioid'], 'item_name'=>$params['rol']])!=NULL){
        //     AuthAssignment::deleteAll(['user_id'=>$params['usuarioid'], 'item_name'=>$params['rol']]);
        // }
        
        // $auth_assignment = new AuthAssignment();
        // $auth_assignment->setAttributes(['item_name'=>$params['rol'],'user_id'=>strval($params['usuarioid'])]);
        // if(!$auth_assignment->save()){
        //     throw new \yii\web\HttpException(400, json_encode($auth_assignment->errors));
        // }

        ######### Fin de asignacion de Rol ###########

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
