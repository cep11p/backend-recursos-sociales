<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\modules\api\models;

use dektrium\user\models\User;

class ApiUser extends User {

    use \msheng\JWT\UserTrait;

    const USUARIO_ADMIN = 'usuario_admin';
    const USUARIO_SOPORTE = 'usuario_soporte';
    const USUARIO_GENERAL = 'usuario_general';
    const USUARIO_EMPRENDER = 'usuario_emprender';
    const USUARIO_HABITAT = 'usuario_habitat';
    const USUARIO_MICRO_EMPRENDIEMIENTO = 'usuario_micro_emprendimiento';
    const USUARIO_MODULO_ALIMENTICIO = 'usuario_modulo_alimenticio';
    const USUARIO_RIO_NEGRO_PRESENTE = 'usuario_rio_negro_presente';
    const USUARIO_SUBSIDIO = 'usuario_subsidio';

}