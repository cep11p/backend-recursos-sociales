<?php

/**** obtener lista de Personas ***
@url ejemplo http://recurso-social.local/api/recursos
@url ejemplo http://recurso-social.local/api/recursos?acreditacion=true&baja=true
@url con criterio de busquedad ejemplo http://recurso-social.local/api/recursos?global_param=lopez&localidadid=2
 * global_param : busca por nombre, apellido y nro_documento
 * localidadid : busca por localidad
 * calle : busca por nombre de calle
 * programaid : busca por programa
 * tipo_recursoid : busca por tipo de recursos
 * fecha_hasta : busca por un rango de fecha sobre fecha_inicial
 * fecha_desde : busca por un rango de fecha sobre fecha_inicial
 * acreditacion = true busca los recursos que fueron acreditados
 * baja = true busca los recursos que fueron dados de baja
@Method GET

{
    "pagesize": 20,
    "pages": 4,
    "total_filtrado": 71,
    "monto_acreditado": 32247.37,
    "monto_baja": 36457.06,
    "monto_sin_acreditar": 1275179.09,
    "recurso_acreditado_cantidad": 3,
    "recurso_baja_cantidad": 2,
    "resultado": [
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
            "programa": "Emprender",
            "tipo_recurso": "Alimentación",
            "persona": {
                "id": 1,
                "nombre": "Victoria Margarita",
                "apellido": "González",
                "apodo": "",
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
                }
            }
        },
        {2...}
        {3...}
        {4...},
        {
            "id": 20,
            "fecha_inicial": "2016-01-11",
            "fecha_alta": "2016-05-19",
            "monto": 16456.9,
            "observacion": "Observacion Fixture 20",
            "proposito": "Un proposito hecho con fixtures 20",
            "programaid": 1,
            "tipo_recursoid": 2,
            "personaid": 10,
            "programa": "Subsidio",
            "tipo_recurso": "Empleo/Formación Laboral",
            "persona": {
                "id": 10,
                "nombre": "Luisa Fernanda",
                "apellido": "Sánchez",
                "apodo": "",
                "nro_documento": "7897018",
                "fecha_nacimiento": "0000-00-00",
                "estado_civilid": null,
                "telefono": "",
                "celular": "2920412236",
                "sexoid": 2,
                "tipo_documentoid": null,
                "nucleoid": 10,
                "situacion_laboralid": null,
                "generoid": null,
                "email": "",
                "cuil": "1578970189",
                "red_social": "",
                "estudios": [],
                "sexo": "Mujer",
                "genero": "",
                "estado_civil": "",
                "lugar": {
                    "id": 10,
                    "nombre": "",
                    "calle": "calle10",
                    "altura": "",
                    "localidadid": 1,
                    "latitud": "-1234114",
                    "longitud": "21314133",
                    "barrio": "barrio1",
                    "piso": "9º",
                    "depto": "5",
                    "escalera": "",
                    "entre_calle_1": "",
                    "entre_calle_2": "",
                    "localidad": "Capital Federal"
                }
            }
        }
    ]
}
**/

/***** Para crear una prestacion de Emprender con sus alumnos****
@url http://recurso-social.local/api/recursos
@method POST
@return array {"message":"Se guarda una prestacion","success":true,"data":{"id":39}}
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
 * 
 */


/**
 **** Para crear cualquier otra prestacion****
 * @url http://recurso-social.local/api/recursos
 * @method POST
 * @param
 * {
        "personaid": 9,
        "programaid": 2,
        "tipo_recursoid": 1,
        "prosito": "un proposito",
        "fecha_alta": "2011-02-02",
        "monto": 1234.4,
        "observacion": "uuuuuuunaaaaaaaaaaaaa Observacion",
    }
 */

/**
 **** Para visualizar un Recurso(prestacion)****
 * @url http://recurso-social.local/api/recursos/1
 * @method GET
 * @param
 * {
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
        "fecha_acreditacion": null,
        "descripcion_baja": null,
        "programa": "Emprender",
        "tipo_recurso": "Alimentación",
        "persona": {
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
            }
        }
    }
 */

/**
 **** Realiza una baja de una recurso(prestacion) ****
 * @url http://recurso-social.local/api/recursos/baja/1
 * @method PUT
 * @param
    {
        "fecha_baja":"2019-01-10",
        "descripcion_baja":"una baja de ejemplo"
    }
 */

/**
 **** Realiza una baja de una recurso(prestacion) ****
 * @url http://recurso-social.local/api/recursos/acreditar/1
 * @method PUT
 * @param
    {
        "fecha_acreditacion": "2014-10-06"
    }
 */
