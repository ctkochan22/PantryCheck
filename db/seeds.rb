# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(pantry_id: 1, personalstore_id: 2, phone_number: "4156249126", first_name: "Kosuke", last_name: "Tseng", password_digest: '1951')

User.create(pantry_id: 1, phone_number: "4153857063", first_name: "Jake", last_name: "Kaplove", password_digest: '1234')

Pantry.create(name: "Capital", is_private: false)
Pantry.create(name: "Kosuke's Personal", is_private: true)

ingredient_list = [
{pantry_id: 1, name: "Coconut Oil", category: "misc", storage_type: "volume", amount: "0.75"},
{pantry_id: 1, name: "Paprika", category: "spice", storage_type: "spice", amount: "0.75"},
{pantry_id: 1, name: "Garlic Salt", category: "spice", storage_type: "spice", amount: "0.5"},
{pantry_id: 2, name: "Rosemary", category: "spice", storage_type: "spice", amount: "0.5"}
]

ingredient_list.each do |item_details|
  Ingredient.create(item_details)
end