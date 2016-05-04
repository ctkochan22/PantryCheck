# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(pantry_id: 1, personal_store: 2, phone_number: "4156249126", first_name: "Kosuke", last_name: "Tseng")

Pantry.create()
Pantry.create()

ingredient_list = [
{pantry_id: 1, name: "Coconut Oil", }
]

