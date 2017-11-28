# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  name: "Admin",
  email: "admin@email.com",
  password: "password",
  password_confirmation: "password",
  admin: true)

User.create(
  name: "User",
  email: "user@email.com",
  password: "password",
  password_confirmation: "password",
  admin: false)

Category.create(name: "Appetizer", id: 1)
Category.create(name: "Main Course", id: 2)
Category.create(name: "Dessert", id: 3)

Item.create(
  name: "Chicken Wings",
  description: "Chicken wings with your choice of sauce.",
  category_id: 1,
  price: 8.99,
  lunch: true,
  dinner: true)

Item.create(
  name: "Jalapeno Poppers",
  description: "Baked jalapenos filled with cream cheese and wrapped in BACON!",
  category_id: 1,
  price: 9.99,
  lunch: false,
  dinner: true)

Item.create(
  name: "Buffalo Cauliflower",
  description: "Beer battered deep-fried cauliflower covered in buffalo sauce.",
  category_id: 1,
  price: 7.99,
  lunch: true,
  dinner: false)

Item.create(
  name: "Crab Dip",
  description: "Cheesy crab dip served with pita bread.",
  category_id: 1,
  price: 6.99,
  lunch: true,
  dinner: true)

Item.create(
  name: "Pizza",
  description: "A pizza with our choice of toppings. More than likely ham and pineapple. Sorry.",
  category_id: 2,
  price: 14,
  lunch: true,
  dinner: true)

Item.create(
  name: "Fish and Chips",
  description: "Fresh out of the Chicago River, breaded and served with french fries.",
  category_id: 2,
  price: 12,
  lunch: true,
  dinner: true)

Item.create(
  name: "Chicken Strips",
  description: "The default option for the pickiest of eaters. Served with fries.",
  category_id: 2,
  price: 8,
  lunch: true,
  dinner: false)

Item.create(
  name: "Steak",
  description: "16oz steak served with onions and mushrooms",
  category_id: 2,
  price: 15.99,
  lunch: false,
  dinner: true)

Item.create(
  name: "Chocolate Cake",
  description: "You can have your cake and eat it too",
  category_id: 3,
  price: 4.99,
  lunch: false,
  dinner: true)

Item.create(
  name: "Churros",
  description: "Fried dough pastry with cinnamon and sugar",
  category_id: 3,
  price: 4.99,
  lunch: true,
  dinner: true)

Item.create(
  name: "Key Lime Pie",
  description: "It's green, and it tastes good.",
  category_id: 3,
  price: 7.99,
  lunch: true,
  dinner: true)

Item.create(
  name: "Ice Cream",
  description: "Choose from an assortment of flavors and toppings",
  category_id: 3,
  price: 3.99,
  lunch: true,
  dinner: false)
