# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user1 = User.create(pantry_id: 1, personalstore_id: 2, phone_number: "4156249126", first_name: "Kosuke", last_name: "Tseng", password: '1951')

user2 = User.create(pantry_id: 1, phone_number: "4153857063", first_name: "Jake", last_name: "Kaplove", password: '1234')


Pantry.create(name: "Capital", is_private: false)
Pantry.create(name: "Kosuke's Personal", is_private: true)

ingredient_list = [
{pantry_id: 1, name: "Coconut Oil", search_name: 'coconut oil', category: "msc", storage_type: "bsc", amount: "About 75%"},
{pantry_id: 1, name: "Paprika", search_name: 'paprika', category: "spi", storage_type: "bsc", amount: "About 75%"},
{pantry_id: 1, name: "Garlic Salt", search_name: 'garlic salt', category: "spi", storage_type: "bsc", amount: "About 75%"},
{pantry_id: 1, name: "Jim Beam Whiskey", search_name: 'jim bream whiskey', category: "bev", storage_type: "bsc", amount: "full"},
{pantry_id: 1, name: "Salmon", search_name: 'salmon', category: "mea", storage_type: "num", amount: "3"},
{pantry_id: 2, name: "Rosemary", search_name: 'rosemary', category: "spi", storage_type: "bsc", amount: "half"}
]

ingredient_list.each do |item_details|
  Ingredient.create(item_details)
end