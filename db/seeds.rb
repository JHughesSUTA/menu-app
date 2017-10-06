# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Item.create(name: "Pizza Rolls", description: "Delicious rolls of pizza ingredients", price: 3.99, category_id: 1 )
Item.create(name: "Buffalo Cauliflower", description: "Beer battered and drenched in buffalo sauce", price: 7.99, category_id: 1)
Item.create(name: "Jalapeno Poppers", description: "Jalapenos stuffed with cream cheese and wrapped in BACON...yummmmmm", price: 5.99, category_id: 1)
Item.create(name: "Steak", description: "12oz strip steak cooked to your taste", price: 19.99, category_id: 2)
Item.create(name: "Fish and Chips", description: "Cod with french fries", price: 11.00, category_id: 2)
Item.create(name: "Pizza", description: "10 inch pizza, served with toppings of our choice. Usually ham and pineapple", price: 9.99, category_id: 2)
Item.create(name: "Fried Icecream", description: "It's magic", price: 4.99, category_id: 3)
Item.create(name: "Lobster", description: "Whole Maine Lobster served with melted butter and your choice of side", price: 29.99, category_id: 2)
Item.create(name: "Cinnamon Roll", description: "drenched in icing", price: 4.99, category_id: 3)
