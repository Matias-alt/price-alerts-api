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
      id: 5,
      name: "ENERGETICA MR BIG",
      url_image: "https://dojiw2m9tvv09.cloudfront.net/11132/product/misterbig3308256.jpg",
      price: 1490,
      discount: 20,
      category: 1
  },
  {
      id: 6,
      name: "ENERGETICA RED BULL",
      url_image: "https://dojiw2m9tvv09.cloudfront.net/11132/product/redbull8381.jpg",
      price: 1490,
      discount: 0,
      category: 1
  },
  ....... 
]
```



