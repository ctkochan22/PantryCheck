# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(pantry_id: 1, personal_store: 2, phone_number: "4156249126", first_name: "Kosuke", last_name: "Tseng")

Pantry.create(name: "Capital")
Pantry.create(name: "Kosuke's Personal")

ingredient_list = [
{pantry_id: 1, name: "Coconut Oil", category: "misc", storage_type: "volume", amount: "0.75"},
{pantry_id: 1, name: "Paprika", category: "spice", storage_type: "spice", amount: "0.75"},
{pantry_id: 1, name: "Garlic Salt", category: "spice", storage_type: "spice", amount: "0.5"},
{pantry_id: 2, name: "Rosemary", category: "spice", storage_type: "spice", amount: "0.5"}
]

