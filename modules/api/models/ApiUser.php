<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\modules\api\models;

use app\models\UserPersona;
use dektrium\user\models\User;
use yii\web\UnauthorizedHttpException;

class ApiUser extends User {

    use \msheng\JWT\UserTrait;

    /**
     * Finds User model using static method findOne
     * Override this method in model if you need to complicate id-management
     * @param  integer $id if of user to search
     * @return mixed       User model
     * @throws \yii\web\UnauthorizedHttpException if model is not found
     */
    public static function findByUid($id)
    {
        $model = static::findOne($id);
        $errorText = "Incorrect token";
        // Throw error if user is missing
        if (empty($model)) {
            throw new UnauthorizedHttpException($errorText);
        }
        
        $user_persona = UserPersona::findOne(['userid'=>$id]);
        if (isset($user_persona->fecha_baja) || !empty($user_persona->fecha_baja)) {
            throw new UnauthorizedHttpException('El usuario esta inhabilitado');
        }
        return $model;
    }
}