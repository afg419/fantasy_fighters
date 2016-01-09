# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

dojo_1 = Dojo.create(dojo_name: "Aaron's Ninjas", password: "password", role: 1)
dojo_2 = Dojo.create(dojo_name: "Lenny's Ninjas", password: "password")
dojo_3 = Dojo.create(dojo_name: "Beth's Ninjas", password: "password")

c_1 = Combatant.create({name: "Beth", race: "Human", strength: 0, intelligence: 15, dexterity: 0, hp: 8})
c_2 = Combatant.create({name: "Carl", race: "Ogre", strength: 0, intelligence: 15, dexterity: 0, hp: 10})
c_3 = Combatant.create({name: "Hotdog", race: "Elf", strength: 6, intelligence: 6, dexterity: 3, hp: 6})
c_4 = Combatant.create({name: "Taylor", race: "Human", strength: 5, intelligence: 9, dexterity: 1, hp: 8})

dojo_1.combatants << c_1
dojo_1.combatants << c_2

dojo_2.combatants << c_2
dojo_2.combatants << c_3

dojo_3.combatants << c_2
dojo_3.combatants << c_4
