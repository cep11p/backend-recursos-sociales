<?php

/**** Para mostrar listado ****/
/**
* @url http://prestaciones-sociales.local/api/permisos
* @method GET
* @arrayReturn
[
    {
        "name": "persona_crear",
        "type": 2,
        "description": "Permite registrar una persona",
        "rule_name": null,
        "data": null,
        "created_at": 1609162941,
        "updated_at": null
    },
    {
        "name": "persona_modificar",
        "type": 2,
        "description": "Permite modificar una persona",
        "rule_name": null,
        "data": null,
        "created_at": 1609162941,
        "updated_at": null
    },
    {
        "name": "prestacion_acreditar",
        "type": 2,
        "description": "Permite acreditar prestaciones de su programa",
        "rule_name": "prestacion_rule",
        "data": null,
        "created_at": 1609162941,
        "updated_at": 1609345941
    },
    {
        "name": "prestacion_baja",
        "type": 2,
        "description": "Permite dar de baja prestaciones de su programa",
        "rule_name": "prestacion_rule",
        "data": null,
        "created_at": 1609162941,
        "updated_at": 1609338684
    },
    {
        "name": "prestacion_crear",
        "type": 2,
        "description": "Permite crear una prestaciones de su programa",
        "rule_name": "prestacion_rule",
        "data": null,
        "created_at": 1609162941,
        "updated_at": 1609344879
    },
    {
        "name": "prestacion_ver",
        "type": 2,
        "description": "Permite ver prestaciones de su programa",
        "rule_name": "prestacion_rule",
        "data": null,
        "created_at": 1609162941,
        "updated_at": 1609343873
    }
]
*/

/*****Para crear****
* @url http://prestaciones-sociales.local/api/permiso 
* @method POST
* @param arrayJson
**/

/**** Para modificar*****
* @url http://prestaciones-sociales.local/api/permiso/{$id} 
* @method PUT
* @param arrayJson
**/

/****** Para visualizar*****
* @url http://prestaciones-sociales.local/api/permiso/{$id} 
* @method GET
* @return arrayJson
*/

/****** Para borrar una localidad *****
* @url http://prestaciones-sociales.local/api/permiso/{$id} 
* @method Delete
* @return arrayJson
*/
