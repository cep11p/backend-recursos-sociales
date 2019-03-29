<?php

/**** Para mostrar listado ****/
/**
* @url http://recurso-social.local/api/beneficiarios
* @url con criterio de busquedad ejemplo http://recurso-social.local/api/recursos?global_param=lopez
* global_param : busca por nombre, apellido y nro_documento
* @method GET
* @return arrayJson es una lista de beneficiarios
{
    "pagesize": 20,
    "pages": 2,
    "total_filtrado": 27,
    "monto_acreditado": 32247.37,
    "monto_baja": 36457.06,
    "monto_sin_acreditar": 1275179.09,
    "recurso_acreditado_cantidad": 3,
    "recurso_baja_cantidad": 2,
    "resultado": [
        {
            "personaid": 1,
            "monto": 64826.61,
            "monto_acreditado": 3212.23,
            "monto_baja": 0,
            "monto_sin_acreditar": 61614.38,
            "recurso_cantidad": 5,
            "recurso_baja_cantidad": 0,
            "recurso_acreditado_cantidad": 1,
            "persona": {
                "id": 1,
                "nombre": "Victoria Margarita",
                "apellido": "González",
                "apodo": "",
                "nro_documento": "23851266",
                "fecha_nacimiento": "1982-12-30",
                "estado_civilid": 1,
                "telefono": "2920430000",
                "celular": "2920412227",
                "sexoid": 2,
                "tipo_documentoid": 1,
                "nucleoid": 1,
                "situacion_laboralid": 1,
                "generoid": 2,
                "email": "email22@correo.com",
                "cuil": "20238512669",
                "red_social": "redsocial1",
                "estudios": [],
                "sexo": "Mujer",
                "genero": "Femenino",
                "estado_civil": "Soltero/a",
                "lugar": {
                    "id": 1,
                    "nombre": "",
                    "calle": "calle1",
                    "altura": "100",
                    "localidadid": 2538,
                    "latitud": "-1234123",
                    "longitud": "21314124",
                    "barrio": "barrio1",
                    "piso": "0º",
                    "depto": "A",
                    "escalera": "Entrecalle1",
                    "entre_calle_1": "Entrecalle1",
                    "entre_calle_2": "Entrecalle-103",
                    "localidad": "El Bolson"
                }
            }
        },
        {...},
        {...},
        {...},
        {
            "personaid": 4,
            "monto": 99192.94,
            "monto_acreditado": 0,
            "monto_baja": 0,
            "monto_sin_acreditar": 99192.94,
            "recurso_cantidad": 5,
            "recurso_baja_cantidad": 0,
            "recurso_acreditado_cantidad": 0,
            "persona": {
                "id": 4,
                "nombre": "Natalia Valentina",
                "apellido": "Fernández",
                "apodo": "",
                "nro_documento": "25047036",
                "fecha_nacimiento": "1982-12-27",
                "estado_civilid": 4,
                "telefono": "2920430003",
                "celular": "2920412230",
                "sexoid": 2,
                "tipo_documentoid": 1,
                "nucleoid": 4,
                "situacion_laboralid": 1,
                "generoid": 2,
                "email": "email22@correo.com",
                "cuil": "20250470369",
                "red_social": "redsocial4",
                "estudios": [
                    {
                        "id": 4,
                        "titulo": "Titulo fixture 4",
                        "completo": 1,
                        "en_curso": 0,
                        "nivel_educativoid": 4,
                        "nivel_educativo": "Terciario",
                        "anio": "2001"
                    }
                ],
                "sexo": "Mujer",
                "genero": "Femenino",
                "estado_civil": "Viudo/a",
                "lugar": {
                    "id": 4,
                    "nombre": "",
                    "calle": "calle4",
                    "altura": "",
                    "localidadid": 2541,
                    "latitud": "-1234120",
                    "longitud": "21314127",
                    "barrio": "barrio4",
                    "piso": "3º",
                    "depto": "D",
                    "escalera": "Entrecalle4",
                    "entre_calle_1": "Entrecalle4",
                    "entre_calle_2": "Entrecalle-100",
                    "localidad": "Rio Villegas"
                }
            }
        }
    ]
}
*/

/****** Para visualizar*****
* @url http://recurso-social.local/api/beneficiario/{$id} 
* @method GET
* @return arrayJson es un benficiario con todas sus prestaciones ordenas por fecha_alta desc y agrupados por programa
 {
    "id": 1,
    "nombre": "Victoria Margarita",
    "apellido": "González",
    "nro_documento": "23851266",
    "fecha_nacimiento": "1982-12-30",
    "estado_civilid": 1,
    "telefono": "2920430000",
    "celular": "2920412227",
    "sexoid": 2,
    "tipo_documentoid": 1,
    "nucleoid": 1,
    "situacion_laboralid": 1,
    "generoid": 2,
    "email": "email22@correo.com",
    "cuil": "20238512669",
    "red_social": "redsocial1",
    "estudios": [],
    "sexo": "Mujer",
    "genero": "Femenino",
    "estado_civil": "Soltero/a",
    "lugar": {
        "id": 1,
        "nombre": "",
        "calle": "calle1",
        "altura": "100",
        "localidadid": 2538,
        "latitud": "-1234123",
        "longitud": "21314124",
        "barrio": "barrio1",
        "piso": "0º",
        "depto": "A",
        "escalera": "Entrecalle1",
        "entre_calle_1": "Entrecalle1",
        "entre_calle_2": "Entrecalle-103",
        "localidad": "El Bolson"
    },
    "recurso_lista": [
        [
            {
                "programa": "Emprender",
                "recurso_cantidad": 2,
                "recursos": [
                    {
                        "id": 31,
                        "fecha_inicial": "2043-09-09",
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
                        "tipo_recurso": "Alimentación",
                        "baja": false,
                        "acreditacion": false
                    },
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
                        "fecha_baja": null,
                        "fecha_acreditacion": "2019-03-02",
                        "descripcion_baja": null,
                        "programa": "Emprender",
                        "tipo_recurso": "Alimentación",
                        "baja": false,
                        "acreditacion": true
                    }
                ]
            },
            {
                "programa": "Río Negro Presente",
                "recurso_cantidad": 2,
                "recursos": [
                    {
                        "id": 54,
                        "fecha_inicial": "2043-08-04",
                        "fecha_alta": "2019-09-07",
                        "monto": 15789.64,
                        "observacion": "Observacion Fixture 54",
                        "proposito": "Un proposito hecho con fixtures 54",
                        "programaid": 2,
                        "tipo_recursoid": 2,
                        "personaid": 1,
                        "fecha_baja": null,
                        "fecha_acreditacion": null,
                        "descripcion_baja": null,
                        "programa": "Río Negro Presente",
                        "tipo_recurso": "Empleo/Formación Laboral",
                        "baja": false,
                        "acreditacion": false
                    },
                    {
                        "id": 21,
                        "fecha_inicial": "2016-01-10",
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
                        "tipo_recurso": "Mejora Habitacional",
                        "baja": false,
                        "acreditacion": false
                    }
                ]
            },
            {
                "programa": "Subsidio",
                "recurso_cantidad": 1,
                "recursos": [
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
                        "tipo_recurso": "Empleo/Formación Laboral",
                        "baja": false,
                        "acreditacion": false
                    }
                ]
            }
        ]
    ]
}
*/

