/* 
1. Создать коллекцию profiles
2. Заполнить коллекцию 7 документами с профайлами со свойствами (id, firstname, lastname, age, gender, position, salary, country, city). Используйте следующие данные:
​
1 Ivan Petrov, 28, male, Product manager, 5000, Germany, Berlin
2 Svetlana Ivanova, 38, female, Designer, 3000, Germany, Bremen
3 Olga Sidorova, 22, female, PR manager, 4500, Germany, Dresden
4 Petr Orlov, 27, male, Web-developer, 5500, Italy, Milan
5  Alina Ushanova, 43,  female, Senior Web-developer, 6500, France, Paris
6 Oleg Polin, 39, male, CEO, 7600, France, Lyon
7 Mark Demidov, 36, male, Assistant, 3400, Spain, Madrid
*/
​
db.createCollection('profiles') 
​
db.profiles.insertMany([
  {
    id: 1,
    firstname: 'Ivan',
    lastname: 'Petrov',
    age: 28,
    gender: 'male',
    position: 'Product manager',
    salary: 5000,
    country: 'Germany',
    city: 'Berlin'
  },
  {
    id: 2,
    firstname: 'Svetlana',
    lastname: 'Ivanova',
    age: 38,
    gender: 'female',
    position: 'Designerr',
    salary: 3000,
    country: 'Germany',
    city: 'Bremen'
  },
  {
    id: 3,
    firstname: 'Olga',
    lastname: 'Sidorova',
    age: 22,
    gender: 'female',
    position: 'PR manager',
    salary: 4500,
    country: 'Germany',
    city: 'Dresden'
  },
  {
    id: 4,
    firstname: 'Petr',
    lastname: 'Orlov',
    age: 27,
    gender: 'male',
    position: 'Web-developer',
    salary: 5500,
    country: 'Italy',
    city: 'Milan'
  },
  {
    id: 5,
    firstname: 'Alina',
    lastname: 'Ushanova',
    age: 43,
    gender: 'female',
    position: 'Senior Web-developer',
    salary: 6500,
    country: 'France',
    city: 'Paris'
  },
  {
    id: 6,
    firstname: 'Oleg',
    lastname: 'Polin',
    age: 39,
    gender: 'male',
    position: 'CEO',
    salary: 7600,
    country: 'France',
    city: 'Lyon'
  },
  {
    id: 7,
    firstname: 'Mark',
    lastname: 'Demidov',
    age: 36,
    gender: 'male',
    position: 'Assistant',
    salary: 3400,
    country: 'Spain',
    city: 'Madrid'
  }
])
​
// 3. Пользователю с id 3 измените свойство city на пустой массив
​
db.profiles.updateOne(
  {id: 3},
  {$set: {city: []}}
)
​
// 4. Пользователю с id 3 добавьте в массив city город Bremen.
​
db.profiles.updateOne(
  {id: 3},
  {$push: {city: 'Bremen'}}
)
​
// 5. Пользователям с именами Mark и Oleg измените свойство city на массив и добавьте в него города Madrid, Barcelona, Valencia (в 2 шага)
​
db.profiles.updateMany(
  {firstname: {$in: ['Mark', 'Oleg']}},
  {$set: {city: []}}
)
​
db.profiles.updateMany(
  {firstname: {$in: ['Mark', 'Oleg']}},
  {$push: {city: {$each: ['Madrid', 'Barcelona', 'Valencia']}}}
)
​
​
// 6. Всем документам добавьте свойство status со значением ‘not defined’
​
db.profiles.updateMany(
  {},
  {$set: {status: 'not defined'}}
)
​
// 7. Всем людям старше 30 (вкл. 30) обновить свойство status на ‘older than 30’
​
db.profiles.updateMany(
  {age: {$gte: 30}},
  {$set: {status: 'older than 30'}}
)
​
// 8. Всем людям младше 30 обновить свойство status на ‘younger than 30’
​
db.profiles.updateMany(
  {age: {$lt: 30}},
  {$set: {status: 'younger than 30'}}
)
​
// 9. Женщинам старше 40 лет увеличить зарплату на 1000
​
db.profiles.updateMany(
  {age: {$gte: 40}, gender: 'female'},
  {$inc: {salary: 1000}}
)
​
// 10. Людям с айди от 4 до 6 увеличить зарплату на 300
​
db.profiles.updateMany(
  {id: {$gte: 4, $lte: 6}},
  {$inc: {salary: 300}}
)
​
// 11. Вывести первые три документа из коллекции
​
db.profiles.find().limit(3)
​
// 12. Вывести все документы, начиная с третьего
​
db.profiles.find().skip(2)
​
// 13. Вывести 4, 5 и 6 документы
​
db.profiles.find().skip(3).limit(3)
​
// 14. Отсортировать документы по возрасту людей (от младшего к старшему)
​
db.profiles.find().sort({age: 1})
​
// 15. Отсортировать документы по возрасту людей (от старшего к младшему)
​
db.profiles.find().sort({age: -1})
​
// 16. Отсортировать документы по зарплате людей (от самой большой зарплаты до самой маленькой)
​
db.profiles.find().sort({salary: -1})
​
// 17. Отсортировать людей в алфавитном порядке по имени
​
db.profiles.find().sort({firstname: 1})

/*
ДЗ:
1. Вывести 3 самых молодых людей
2. Вывести 5 документов с самой большой зарплатой
3. Отсортировать людей по фамилии в алфавитном порядке
4. Вывести 2, 3, 4 и 5 документы
5. Разобраться с тем, как работает оператор $slice
*/

// 1. 

db.profiles.find().sort({age: 1}).limit(3)

// 2.

db.profiles.find().sort({salary: -1}).limit(5)

// 3.

db.profiles.find().sort({lastname: 1})

// 4.

db.profiles.find().skip(1).limit(4)

// 5.

//Done!







