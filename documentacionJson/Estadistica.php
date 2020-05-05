<?php

/**** Se obtienen la cantidad de beneficiarios clasificados por programas en una determinada localidad ***
@url ejemplo http://recurso-social.local/api/estadisticas/modulo-alimentario-por-localidad
@Method GET
[
    {
        "localidadid": "2576",
        "modulo_cantidad": "33",
        "beneficiario_cantidad": "32",
        "localidad": "General Roca"
    },
    {
        "localidadid": "2586",
        "modulo_cantidad": "297",
        "beneficiario_cantidad": "297",
        "localidad": "Cipolletti"
    },
    {
        "localidadid": "2587",
        "modulo_cantidad": "28",
        "beneficiario_cantidad": "28",
        "localidad": "Cinco Saltos"
    },
    {
        "localidadid": "2589",
        "modulo_cantidad": "10",
        "beneficiario_cantidad": "10",
        "localidad": "Allen"
    },
    {
        "localidadid": "2629",
        "modulo_cantidad": "22",
        "beneficiario_cantidad": "22",
        "localidad": "San Antonio Oeste"
    },
    {
        "localidadid": "2640",
        "modulo_cantidad": "17",
        "beneficiario_cantidad": "17",
        "localidad": "Viedma"
    }
]
 */

/**** Se obtienen la cantidad de beneficiarios clasificados por programas en una determinada localidad ***
@url ejemplo http://recurso-social.local/api/estadisticas/beneficiarios-por-programa-en-localidad/2640
@Method GET
[
    {
        "localidadid": "2640",
        "nombre": "Emprender",
        "beneficiario_cantidad": "4"
    },
    {
        "localidadid": "2640",
        "nombre": "Hábitat",
        "beneficiario_cantidad": "2"
    },
    {
        "localidadid": "2640",
        "nombre": "Río Negro Presente",
        "beneficiario_cantidad": "2"
    },
    {
        "localidadid": "2640",
        "nombre": "Subsidio",
        "beneficiario_cantidad": "7"
    }
]
 */

/**** Se obtienen la cantidad de beneficiarios clasificados por tipos de recurso(tipo de prestacion) en una determinada localidad ***
@url ejemplo http://recurso-social.local/api/estadisticas/beneficiarios-por-tipo-recurso-en-localidad/2640
@Method GET
[
    {
        "localidadid": "2640",
        "nombre": "Alimentación",
        "beneficiario_cantidad": "5"
    },
    {
        "localidadid": "2640",
        "nombre": "Empleo/Formación Laboral",
        "beneficiario_cantidad": "4"
    },
    {
        "localidadid": "2640",
        "nombre": "Mejora Habitacional",
        "beneficiario_cantidad": "4"
    }
]
 */

/**** Se obtienen montos (acreditado, sin acreditar, baja) clasificados por un rango de localidades
@url ejemplo http://recurso-social.local/api/estadisticas/montos-por-localidades/{int rango}
@Method GET
[
   {
       "localidadid": 2539,
       "monto_acreditado": 210873.43,
       "monto_baja": 51395.79,
       "monto_sin_acreditar": 35356.12,
       "recurso_cantidad": 16,
       "recurso_baja_cantidad": 4,
       "recurso_acreditado_cantidad": 10,
       "beneficiario_cantidad": 8,
       "monto": 297625.34
   },
   {
       "localidadid": 2640,
       "monto_acreditado": 99058.48,
       "monto_baja": 117352.5,
       "monto_sin_acreditar": 63936.3,
       "recurso_cantidad": 16,
       "recurso_baja_cantidad": 5,
       "recurso_acreditado_cantidad": 7,
       "beneficiario_cantidad": 9,
       "monto": 280347.28
   },
   {
       "localidadid": 2586,
       "monto_acreditado": 155929.52,
       "monto_baja": 36458.73,
       "monto_sin_acreditar": 79647,
       "recurso_cantidad": 15,
       "recurso_baja_cantidad": 3,
       "recurso_acreditado_cantidad": 10,
       "beneficiario_cantidad": 8,
       "monto": 272035.25
   },
   {
       "localidadid": 2577,
       "monto_acreditado": 81204.55,
       "monto_baja": 129658.7,
       "monto_sin_acreditar": 45261,
       "recurso_cantidad": 15,
       "recurso_baja_cantidad": 5,
       "recurso_acreditado_cantidad": 6,
       "beneficiario_cantidad": 8,
       "monto": 256124.25
   },
   {
       "localidadid": 2576,
       "monto_acreditado": 113218.12,
       "monto_baja": 78870.05,
       "monto_sin_acreditar": 30023.6,
       "recurso_cantidad": 15,
       "recurso_baja_cantidad": 4,
       "recurso_acreditado_cantidad": 9,
       "beneficiario_cantidad": 8,
       "monto": 222111.77
   }
]
*/


