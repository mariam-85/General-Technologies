db.products.aggregate([
    {
        '$group': {
            '_id': null, 
            'min_price': {'$min': '$price'},
            'max_price': {'$max': '$price'},
            'avg_price': {'$avg': '$price'},
            'products_count': {'$sum': 1},
        }
    }
   
])
   
   
