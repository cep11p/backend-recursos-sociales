<?php

/**** obtener lista de Personas ***
@url ejemplo http://recurso-social.local/api/personas?nombre=lorena&nro_documento=36849868
@Method GET

{
    
}
**/

/***** Para crear****
@url http://recurso-social.local/api/personas
@method POST
@param
{    
    "nombre": "Romina",
    "apellido": "Rodríguez",
    "nro_documento": "29890098",
    "fecha_nacimiento":"1980-12-12",
    "apodo":"rominochi",
    "telefono": "2920430690",
    "celular": "2920412127",
    "situacion_laboralid": 1,
    "estado_civilid": 1,
    "sexoid": 2,
    "tipo_documentoid": 1,
    "generoid": 1,
    "email":"algo@correo.com.ar",
    "red_social":"algodesocial",
    "cuil":"20367655678",
    "estudios": [{
        "nivel_educativoid":4,
        "titulo":"tecnico en desarrollo web",
        "completo":1,
        "en_curso":0,
        "anio":"2014"
    }],
    "lugar": {
        "barrio":"Don bosco",
        "calle":"Mitre",
        "altura":"327",
        "piso":"A",
        "depto":"",
        "escalera":"",
        "localidadid":1,
        "latitud":"-123123",
        "longitud":"321123"
    }    
}

/**** obtener Persona por nro_documento ***
@url ejemplo http://recurso-social.local/api/personas/buscar-por-documento/29800100
@Method GET
{
    "success": true,
    "resultado": [
        {
            "id": 1,
            "nombre": "Romina Belen",
            "apellido": "Rodríguez",
            "apodo": "rominochi",
            "nro_documento": "29800100",
            "fecha_nacimiento": "1980-12-12",
            "estado_civilid": 1,
            "telefono": "2920430690",
            "celular": "2920412127",
            "sexoid": 2,
            "tipo_documentoid": 1,
            "nucleoid": 1,
            "situacion_laboralid": 1,
            "generoid": 1,
            "email": null,
            "cuil": "21298001007",
            ...,
        }
    ]
}
**/