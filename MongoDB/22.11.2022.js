// 1. Создать БД Shop
// 2. Создать коллекцию orders со свойствами id, customer, product, amount, city, используя следующие данные:

// 1 Olga Apple 15.55 Berlin
// 2 Anna Apple 10.05 Madrid
// 3 Olga Kiwi 9.6 Berlin
// 4 Anton Apple 20 Roma
// 5 Olga Banana 8 Madrid
// 6 Petr Orange 18.3 Paris

use users
​
db.createCollection('orders')
​
  db.orders.insertMany([
    {
      id: 1,
      customer: 'Olga',
      product: 'Apple',
      amount: 15.55,
      city: 'Berlin'
    },
    {
        id: 2,
        customer: 'Anna',
        product: 'Apple',
        amount: 10.05,
        city: 'Madrid'
    },
    {
        id: 3,
        customer: 'Olga',
        product: 'Kiwi',
        amount: 9.6,
        city: 'Berlin'
    },
    {
        id: 4,
        customer: 'Anton',
        product: 'Apple',
        amount: 20,
        city: 'Roma'
    },
    {
        id: 5,
        customer: 'Olga',
        product: 'Banana',
        amount: 8,
        city: 'Madrid'
    },
    {
        id: 6,
        customer: 'Petr',
        product: 'Orange',
        amount: 18.3,
        city: 'Paris'
    }
  ])

  // 3. Найти сколько всего было совершено покупок

  db.shop.countDocuments()

  // 4. Найти сколько раз были куплены яблоки

  db.shop.find({product: 'Apple'}).count()

  db.shop.countDocuments({ product: 'Apple' })

  // 5. 
  
  db.shop.find().sort({amount: 1})

  // 6.

  db.shop.find().sort({amount: -1}).limit(3)

  // 7. Найти наименования всех купленных продуктов (['Apple', 'Kiwi', 'Banana', 'Orange'])

  db.shop.distinct('product')

  // 8.

  db.shop.countDocuments({ city: 'Berlin' })

  db.shop.find({city: 'Berlin'}).count()

  // 9.

  db.shop.countDocuments({ product: 'Apple', city: {$in: ['Berlin', 'Madrid'] }})

  // 10.

  db.shop.deleteMany({})

  //11. Посчитать сколько потратили  все клиенты в разбивке по клиентам

  db.orders.aggregate(
      [
          {$match: {}},
          {$group: {_id: '$customer', total: {$sum: '$amount'}}}
      ]
  )

  // 12. 

  db.orders.aggregate(
    [
        {$match: {customer: 'Olga'}},
        {$group: {_id: '$customer', total: {$sum: '$amount'}}}
    ]
)

// 13.

db.orders.aggregate(
    [
        {$match: {customer: {$in: ['Olga', 'Anton']}}},
        {$group: {_id: '$customer', total: {$sum: '$amount'}}}
    ]
)

// 14.

db.orders.aggregate(
    [
        {$match: {}},
        {$group: {_id: '$product', total: {$sum: '$amount'}}}
    ]
)

db.orders.aggregate(
    [
        {$match: {}},
        {$group: {_id: '$product', total: {$sum: '$amount'}}},
        {$sort: {total: 1}}
    ]
)

db.orders.aggregate(
    [
        {$match: {}},
        {$group: {_id: '$product', total: {$sum: '$amount'}}},
    ]
).sort({total: 1})

// 15.

db.orders.aggregate(
    [
        {$match: {}},
        {$group: {_id: '$city', total: {$sum: '$amount'}}},
        {$sort: {total: -1}}
    ]
)

// 16.

db.orders.updateMany(
    {},
    {$set: {count: 0}}
  )

  // 17. Найти общую стоимость всех покупок

  db.orders.aggregate(
    [
        {$match: {}},
        {$group: {_id: 'total_sum', total: {$sum: '$amount'}}}
    ]
)

// 18.

db.orders.updateMany(
    {id: {$in: [1, 3]}},
    {$set: {count: 3}}
  )

  db.orders.updateMany(
    {id: 4},
    {$set: {count: 2}}
  )

  db.orders.updateMany(
    {},
    {$inc: {count: 1}}
  )

  // 19. 

  db.orders.aggregate(
    [
        {$match: {product: 'Apple'}},
        {$group: {_id: '$product', total: {$sum: '$count'}}}
    ]
)

// 20.

db.orders.find({ customer: 'Olga' }).count()

// 21.

db.orders.aggregate(
    [
        {$match: {customer: 'Olga'}},
        {$group: {_id: '$customer', total: {$sum: '$count'}}}
    ]
)

// 22. 

db.orders.aggregate(
    [
        {$match: {customer: {$in: ['Olga', 'Anton']}}},
        {$group: {_id: '$customer', total: {$sum: '$count'}}}
    ]
)

// 24.

db.orders.aggregate(
    [
        {$match: {customer: 'Olga'}},
        {$group: {_id: '$city'}}
    ]
)

// 25. 

db.orders.aggregate(
    [
        {$match: {product: 'Apple', city: 'Berlin'}},
        {$group: {_id: '$product', total: {$sum: '$count'}}}
    ]
)


// 26. 

db.orders.aggregate(
    [
        {$match: {city: {$in: ['Madrid', 'Paris']}}},
        {$group: {_id: 'all_product_count', total: {$sum: '$count'}}}
    ]
)



