// ПРАКТИКА
​
// 1. В БД users создать коллекцию Workers
​
use users
​
db.createCollection('Workers')
​
// 2. В коллекцию workers добавить документы со свойствами id, firstname, lastname, age, position, salary, skills. Используйте следующие данные:
  // 1. Inga Petrova, 27, Barista, 1500, ['preparing drinks', 'cleaning equipment'] 
  // 2. Boris Orlov, 36, Server, 2400, ['taking orders', 'suggesting meals', 'taking payments']
  // 3. Ivan Demidov, 32, Chef, 3200, ['preparing food', 'baking bread']
  // 4. Marina Sidorova, 22, Hostess, 1700, ['greeting guests', 'seating guests', 'answering phone calls']
  // 5. Olga Ivanova, 43, Sommelier, 2500, ['curating a wine list', 'creating wine pairings']
​
​
  db.workers.insertMany([
    {
      id: 1,
      firstname: 'Inga',
      lastname: 'Petrova',
      age: 27,
      position: 'Barista',
      salary: 1500,
      skills: ['preparing drinks', 'cleaning equipment']
    },
    {
      id: 2,
      firstname: 'Boris',
      lastname: 'Orlov',
      age: 36,
      position: 'Server',
      salary: 2400,
      skills: ['taking orders', 'suggesting meals', 'taking payments']
    },
    {
      id: 3,
      firstname: 'Ivan',
      lastname: 'Demidov',
      age: 32,
      position: 'Chef',
      salary: 3200,
      skills: ['preparing food', 'baking bread']
    },
    {
      id: 4,
      firstname: 'Marina',
      lastname: 'Sidorova',
      age: 22,
      position: 'Hostess',
      salary: 1700,
      skills: ['greeting guests', 'seating guests', 'answering phone calls']
    },
    {
      id: 5,
      firstname: 'Olga',
      lastname: 'Ivanova',
      age: 43,
      position: 'Sommelier',
      salary: 2500,
      skills: ['curating a wine list', 'creating wine pairings']
    }
  ])
​
// 3. Работнику с id 3 увеличить зарплату на 400
​
db.workers.updateOne(
  {id: 3},
  {$inc: {salary: 400}}
)
​
// 4. Работникам с id 1 и 4 изменить зарплату на 1800
​
db.workers.updateMany(
  {id: {$in: [1, 4]}},
  {$set: {salary: 1800}}
)
​
// 5. Всем работникам в массив skills добавить навык 'attending group meetings'
​
db.workers.updateMany(
  {},
  {$push: {skills: 'attending group meetings'}}
)
​
// 6. Всем работникам добавить свойство gender со значением 'not defined'
​
db.workers.updateMany(
  {},
  {$set: {gender: 'not defined'}}
)
​
// 7. Работницам Olga, Marina, Inga в свойство gender записать female
​
db.workers.updateMany(
  {firstname: {$in: ['Inga', 'Marina', 'Olga']}},
  {$set: {gender: 'female'}}
)
​
// 8. Работникам Boris и Ivan в свойство gender записать male
​
db.workers.updateMany(
  {firstname: {$in: ['Boris', 'Ivan']}},
  {$set: {gender: 'male'}}
)
​
// 9. Выборки:
// - Вывести всех работников, зарабатывающих 2000 и более
​
db.workers.find(
  {salary: {$gte: 2000}}
)
​
// - Вывести всех работников кроме первого
​
db.workers.find().skip(1)
​
// - Вывести работников с третьего по пятого
​
db.workers.find().skip(2).limit(3)
​
// - Отсортировать работников по возрасту: от самого младшего до самого старшего
​
db.workers.find().sort({age: 1})
​
// - Вывести трех самых старших сотрудников
​
db.workers.find().sort({age: -1}).limit(3)
​
// - Отсортировать работников по зарплате: от самой большой зарплаты до самой маленькой
​
db.workers.find().sort({salary: -1})
​
// - Вывести человека, который зарабатывает меньше всех
​
db.workers.find().sort({salary: 1}).limit(1)
​
​
// $slice
​
// Вывести документ с именем Inga, в skills вывести только первый навык
​
db.workers.find(
  {firstname: 'Inga'},
  {skills: {$slice: 1}}
)
​
// Вывести документ с именем Inga, в skills вывести только последний навык
​
db.workers.find(
  {firstname: 'Inga'},
  {skills: {$slice: -1}}
)
​
// Вывести документ с именем Ivan, в skills вывести только второй навык
​
db.workers.find(
  {firstname: 'Ivan'},
  {skills: {$slice: [1, 1]}} // [skip, limit]
)
​
​
// Задачи на $slice
// 1. Вывести первый навык у работника Boris
​
db.workers.find(
  {firstname: 'Boris'},
  {skills: {$slice: 1}}
)
​
// 2. Вывести у всех работников по последнему навыку
​
db.workers.find(
  {},
  {skills: {$slice: -1}}
)
​
// 3. Вывести второй навык у работника Marina
​
db.workers.find(
  {firstname: 'Marina'},
  {skills: {$slice: [1, 1]}}
)
​
​
// COUNT
​
// Посчитать общее количество документов в коллекции
​
db.workers.countDocuments()
​
// Посчитать количество документов в коллекции, где firstname Boris
​
db.workers.find({firstname: 'Boris'}).count()
​
db.workers.countDocuments({firstname: 'Boris'})
​
// Найти количество работников, зарабатывающих 2000 и более

db.workers.find(
  {salary: {$gte: 2000}}
).count()


// Найти количество людей, зарабатывающих 1800

db.workers.find(
  {salary: 1800}
).count()




_______________________


use users


// Найти количество работников старше 30 лет

db.workers.find(
    {age: {$gt: 30}}
  ).count()

// Найти количество работников старше 30 лет


db.workers.find({age: {$lt: 30},gender: 'female'}).count()


// Найти количество мужчин старше 20 лет, не считая первого

  db.workers.find({age: {$gt: 20},gender: 'male'}).skip(1).count()




// distinct()

db.workers.distinct('firstname')


db.workers.distinct('salary')

db.workers.distinct('position')


//ИНДЕКСАЦИЯ

// Посмотреть статистику запроса
db.workers.find({ salary: 1800 }).explain('executionStats')

// Создать индекс

db.workers.createIndex({ salary: 1800 })

db.workers.createIndexes([ { salary: 1800 }, { age: 22 } ])

db.workers.createIndex({ gender: "female" })

// Удалить индекс

db.workers.dropIndex({ salary: 1800 }) // 'salary_1800'

// Просмотреть все индексы

db.workers.getIndexes()

