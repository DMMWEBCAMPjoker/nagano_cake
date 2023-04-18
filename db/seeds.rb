# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# #Admin.create!(
#    email: 'admin@admin',
#    password: 'testtest'
# )
Genre.create!(
   name: 'cake'
)
Item.create!(
   # id: 1,
   name: 'チョコバナナミルフィーユ',
   price: 1000,
   description: 'aa',
   genre_id: 1
)

#item.image.attach(io: File.open(Rails.root.join('app/assets/images/cat.jpg')),filename: 'cat.jpg')
Customer.create!(
       email: 'admin@admin',
       password: 'testtest'
)

CartItem.create!(
   item_id: 1,
   customer_id: 1,
   quantity: 1
)
