<?php

/**** Para mostrar listado ****/
/**
* @url http://recurso-social.local/api/tipo-responsables
* @method GET
[
    {
        "id": 1,
        "nombre": "Municipio",
        "lista_responsable": [
            {
                "id": 1,
                "nombre": "Allen",
                "direccion": "Libertad 189 (CP 8328)",
                "latitud": null,
                "longitud": null,
                "telefono": "(0298) 4451229/ 4452502/ 4450716/ 445 0687",
                "email": "intendencia@allen.gob.ar"
            },
            {
                "id": 2,
                "nombre": "Campo Grande",
                "direccion": "Ing. Cesar Cipolletti 49 (CP 8305)",
                "latitud": null,
                "longitud": null,
                "telefono": "(0299) 4973173",
                "email": "municpogrande@neunet.com.ar"
            }..
            {}
        ]
    },
    {
        "id": 2,
        "nombre": "Delegacion",
        "lista_responsable": [
            {
                "id": 1,
                "nombre": "Delegacion de Bariloche"
            },
            {
                "id": 2,
                "nombre": "Delegacion del valle"
            }..
            {}
        ]
    }
    {
        "id": 3,
        "nombre": "Comision de fomento",
        "lista_responsable": [
            {
                "id": 1,
                "nombre": "Aguada Cecilio"
            },
            {
                "id": 2,
                "nombre": "Aguada de Guerra"
            },
            {
                "id": 3,
                "nombre": "Aguada Guzmán"
            }
    }
 **/

/*****Para crear****
* @url http://recurso-social.local/api/ 
* @method POST
* @param arrayJson
**/

/**** Para modificar*****
* @url http://recurso-social.local/api//{$id} 
* @method PUT
* @param arrayJson
**/

/****** Para visualizar*****
* @url http://recurso-social.local/api//{$id} 
* @method GET
* @return arrayJson
*/

/****** Para borrar una localidad *****
* @url http://recurso-social.local/api//{$id} 
* @method Delete
* @return arrayJson
*/
