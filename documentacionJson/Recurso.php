<?php

/**** obtener lista de Personas ***
@url ejemplo http://recurso-social.local/api/recursos
@Method GET

{
    "personaid": 9,
    "programaid": 3,
    "tipo_recursoid": 3,
    "prosito": "un proposito",
    "fecha_alta": "2011-02-02",
    "monto": 1234.4,
    "observacion": "uuuuuuunaaaaaaaaaaaaa Observacion",
    "alumno_lista":[
        {"alumnoid":1},
        {"alumnoid":2},
        {"alumnoid":4}
    ]
}
**/

/***** Para crear****
@url http://recurso-social.local/api/personas
@method POST
@param
{
    "personaid": 9,
    "programaid": 3,
    "tipo_recursoid": 3,
    "prosito": "un proposito",
    "fecha_alta": "2011-02-02",
    "monto": 1234.4,
    "observacion": "uuuuuuunaaaaaaaaaaaaa Observacion",
    "alumno_lista":[
    	{"alumnoid":1},
    	{"alumnoid":2},
    	{"alumnoid":4}
    	]
}