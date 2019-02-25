<?php

/**** Para mostrar listado ****/
/**
* @url http://recurso-social.local/api/beneficiarios
* @method GET
* @return arrayJson es una lista de beneficiarios
    {
        "success": "true",
        "pagesize": 20,
        "pages": 1,
        "total_filtrado": 10,
        "resultado": [
            {
                "monto": 49036.97,
                "personaid": 1,
                "programa": null,
                "tipo_recurso": null
            },
            {
                "monto": 109234.15,
                "personaid": 2,
                "programa": null,
                "tipo_recurso": null
            },
            {
                "monto": 66159,
                "personaid": 3,
                "programa": null,
                "tipo_recurso": null
            },
            {
                "monto": 81069.24,
                "personaid": 4,
                "programa": null,
                "tipo_recurso": null
            },
            {
                "monto": 53915.17,
                "personaid": 5,
                "programa": null,
                "tipo_recurso": null
            },
            {
                "monto": 116325.06,
                "personaid": 6,
                "programa": null,
                "tipo_recurso": null
            },
            {
                "monto": 44035.14,
                "personaid": 7,
                "programa": null,
                "tipo_recurso": null
            },
            {
                "monto": 55945.22,
                "personaid": 8,
                "programa": null,
                "tipo_recurso": null
            },
            {
                "monto": 41125.73,
                "personaid": 9,
                "programa": null,
                "tipo_recurso": null
            },
            {
                "monto": 59580.18,
                "personaid": 10,
                "programa": null,
                "tipo_recurso": null
            }
        ]
    }
*/

/****** Para visualizar*****
* @url http://recurso-social.local/api/beneficiario/{$id} 
* @method GET
* @return arrayJson es una benficiario con todas sus prestaciones
    {
       "id": 1,
       "nombre": "Victoria Margarita",
       "apellido": "González",
       "nro_documento": "23851266",
       "fecha_nacimiento": "0000-00-00",
       "estado_civilid": null,
       "telefono": "",
       "celular": "2920412227",
       "sexoid": 2,
       "tipo_documentoid": null,
       "nucleoid": 1,
       "situacion_laboralid": null,
       "generoid": null,
       "email": "",
       "cuil": "20238512669",
       "red_social": "",
       "estudios": [],
       "sexo": "Mujer",
       "genero": "",
       "estado_civil": "",
       "lugar": {
           "id": 1,
           "nombre": "",
           "calle": "calle1",
           "altura": "100",
           "localidadid": 1,
           "latitud": "-1234123",
           "longitud": "21314124",
           "barrio": "barrio1",
           "piso": "0º",
           "depto": "A",
           "escalera": "",
           "entre_calle_1": "",
           "entre_calle_2": "",
           "localidad": "Capital Federal"
       },
       "recurso_lista": {
           "emprender": [
               {
                   "id": 1,
                   "fecha_inicial": "2016-01-30",
                   "fecha_alta": "2014-10-07",
                   "monto": 3212.23,
                   "observacion": "Observacion Fixture 1",
                   "proposito": "Un proposito hecho con fixtures 1",
                   "programaid": 3,
                   "tipo_recursoid": 1,
                   "personaid": 1,
                   "fecha_baja": "2019-01-10",
                   "fecha_acreditacion": null,
                   "descripcion_baja": "una baja de ejemplo",
                   "programa": "Emprender",
                   "tipo_recurso": "Alimentación"
               },
               {
                   "id": 31,
                   "fecha_inicial": "2016-01-11",
                   "fecha_alta": "2016-05-08",
                   "monto": 13245.5,
                   "observacion": "Observacion Fixture 31",
                   "proposito": "Un proposito hecho con fixtures 31",
                   "programaid": 3,
                   "tipo_recursoid": 1,
                   "personaid": 1,
                   "fecha_baja": null,
                   "fecha_acreditacion": null,
                   "descripcion_baja": null,
                   "programa": "Emprender",
                   "tipo_recurso": "Alimentación"
               }
           ],
           "subsidio": [
               {
                   "id": 11,
                   "fecha_inicial": "2016-01-20",
                   "fecha_alta": "2016-05-28",
                   "monto": 16789.6,
                   "observacion": "Observacion Fixture 11",
                   "proposito": "Un proposito hecho con fixtures 11",
                   "programaid": 1,
                   "tipo_recursoid": 2,
                   "personaid": 1,
                   "fecha_baja": null,
                   "fecha_acreditacion": null,
                   "descripcion_baja": null,
                   "programa": "Subsidio",
                   "tipo_recurso": "Empleo/Formación Laboral"
               }
           ],
           "rio_negro_presente": [
               {
                   "id": 21,
                   "fecha_inicial": "2016-01-11",
                   "fecha_alta": "2016-05-18",
                   "monto": 15789.64,
                   "observacion": "Observacion Fixture 21",
                   "proposito": "Un proposito hecho con fixtures 21",
                   "programaid": 2,
                   "tipo_recursoid": 3,
                   "personaid": 1,
                   "fecha_baja": null,
                   "fecha_acreditacion": null,
                   "descripcion_baja": null,
                   "programa": "Río Negro Presente",
                   "tipo_recurso": "Mejora Habitacional"
               }
           ]
       }
   }
*/

/****** Para borrar una localidad *****
* @url http://recurso-social.local/api//{$id} 
* @method Delete
* @return arrayJson
*/
