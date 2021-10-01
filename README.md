# PRICE ALERTS API

Rest api desarrollada con Ruby on Rails, desplegada en Heroku 
https://price-alerts-api.herokuapp.com/api/v1/

Lista de recursos (endpoints):

### 1- /price_alerts <br/>
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

### 1- /price_alerts/:id <br/>
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



