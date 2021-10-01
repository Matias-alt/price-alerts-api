# PRICE ALERTS API

Rest api desarrollada con Ruby on Rails, desplegada en Heroku 
https://price-alerts-api.herokuapp.com/api/v1/

Lista de recursos (endpoints):

### GET /price_alerts <br/>
este endpoint trae todos los registros de la tabla 'price_alerts'

```
OUTPUT:

[
   {
        "id": 78,
        "name": "Viaje fenomenal ",
        "origin": "{\"name\":\"Santiago\", \"id\":9333}",
        "destiny": "{\"name\":\"Valdivia\", \"id\":9360}",
        "travelClass": "{\"name\":\"Pullman\", \"id\":4}",
        "price": 10000,
        "departure_date": "01-01-2050",
        "created_at": "2021-09-29T23:37:35.679Z",
        "updated_at": "2021-09-29T23:37:35.679Z"
    },
    {
        "id": 79,
        "name": "Viaje al Norte",
        "origin": "{\"name\":\"Santiago\", \"id\":9333}",
        "destiny": "{\"name\":\"Illapel\", \"id\":9076}",
        "travelClass": "{\"name\":\"Salon Cama\", \"id\":2}",
        "price": 15000,
        "departure_date": "29-09-2021",
        "created_at": "2021-09-30T00:38:30.258Z",
        "updated_at": "2021-09-30T00:38:30.258Z"
    },
  ....... 
]
```

### GET /price_alerts/:id <br/>
este endpoint trae un registro de la tabla 'price_alerts' segun su id

```
OUTPUT:

{
  "id": 79,
  "name": "Viaje al Norte",
  "origin": "{\"name\":\"Santiago\", \"id\":9333}",
  "destiny": "{\"name\":\"Illapel\", \"id\":9076}",
  "travelClass": "{\"name\":\"Salon Cama\", \"id\":2}",
  "price": 15000,
  "departure_date": "29-09-2021",
  "created_at": "2021-09-30T00:38:30.258Z",
  "updated_at": "2021-09-30T00:38:30.258Z"
}
```

### POST /price_alerts/:id <br/>
este endpoint crea un registro de la tabla 'price_alerts'

```
BODY:

{
    "name": "Viaje Monumental",
    "origin": "{\"name\":\"Santiago\", \"id\":9333}",
    "destiny": "{\"name\":\"Illapel\", \"id\":9076}",
    "travelClass": "{\"name\":\"Salon Cama\", \"id\":2}",
    "price": 5500,
    "departure_date": "29-09-2021"
}
```

### PUT /price_alerts/:id <br/>
este endpoint edita un registro de la tabla 'price_alerts' segun su id

```
BODY:

{
    "name": "Viaje Monumental",
    "origin": "{\"name\":\"Santiago\", \"id\":9333}",
    "destiny": "{\"name\":\"Illapel\", \"id\":9076}",
    "travelClass": "{\"name\":\"Salon Cama\", \"id\":2}",
    "price": 5500,
    "departure_date": "29-09-2021"
}
```

### DELETE /price_alerts/:id <br/>
este endpoint elimina un registro de la tabla 'price_alerts' segun su id



MINIMUM_PRICES

### GET /minimum_prices/get_process <br/>
Este endpoint ejecuta un proceso que busca el precio minimo segun la fecha ingresada como parametro, mas los 7 dias siguientes, entregando una lista con un total de 8 resultados

Los parametros que se describena  continuacion son obligatorios.

PARAMS:

```
originId: Id de la ciudad de origen
destinyId: Id de la ciudad de destino
travelClass: Id del tipo de clase del viaje
departureDate: Fecha de salida del viaje
```

EXAMPLE: /minimum_prices/get_process?originId=9333&destinyId=9360&travelClass=3&departureDate=01-01-2050 <br/>

OUTPUT:

```
{
    "success": true,
    "data": [
        {
            "date": "2050-01-01",
            "schedule": "17:06",
            "travelClass": "SEMI CAMA",
            "price": 8500,
            "busOperator": "Buses Jet Sur"
        },
        {
            "date": "2050-01-02",
            "schedule": "23:06",
            "travelClass": "SEMI CAMA",
            "price": 8500,
            "busOperator": "Buses Jet Sur"
        },
        {
            "date": "2050-01-03",
            "schedule": "19:06",
            "travelClass": "SEMI CAMA",
            "price": 8500,
            "busOperator": "Buses Jet Sur"
        },
        {
            "date": "2050-01-04",
            "schedule": "14:06",
            "travelClass": "SEMI CAMA",
            "price": 8500,
            "busOperator": "Buses Jet Sur"
        },
        {
            "date": "2050-01-05",
            "schedule": "20:06",
            "travelClass": "SEMI CAMA",
            "price": 8500,
            "busOperator": "Buses Jet Sur"
        },
        {
            "date": "2050-01-06",
            "schedule": "23:06",
            "travelClass": "SEMI CAMA",
            "price": 8500,
            "busOperator": "Buses Jet Sur"
        },
        {
            "date": "2050-01-07",
            "schedule": "23:06",
            "travelClass": "SEMI CAMA",
            "price": 8500,
            "busOperator": "Buses Jet Sur"
        },
        {
            "date": "2050-01-08",
            "schedule": "23:06",
            "travelClass": "SEMI CAMA",
            "price": 8500,
            "busOperator": "Buses Jet Sur"
        }
    ]
}
```

