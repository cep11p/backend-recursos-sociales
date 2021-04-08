<?php

/**** Para borrar un cuota****/
/**
* @url http://prestaciones-sociales.local/api/cuotas/10
* Se Borra la cuota solo si fue creado hace no mas de 24hs
* @method DELETE
    {
        "message": "Se borra la cuota con el id: 10"
    }
*/


/********** Listado
 * @url http://prestaciones-sociales.local/api/cuotas
 * Se muestra un listado de cuotas
 * Criterio de busquedad, despues de la url debemos concatenar el signo "?"... ejemplo: @url?
 * recursoid=14 Lista las cuotas de tal prestacion
 * @method GET
 * @return array 
 * [
        {
            "id": 5,
            "monto": 5000,
            "recursoid": 14,
            "fecha_pago": "2021-03-31",
            "create_at": "2021-04-06 12:15:19",
            "borrar": false
        }
    ]
 */