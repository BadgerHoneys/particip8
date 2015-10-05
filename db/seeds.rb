# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(first_name: "Josh", last_name: "Woodward", email: "josh.woodward2693@gmail.com")
User.create(first_name: "Paul", last_name: "Darragh", email: "pmd1234@rit.edu")
User.create(first_name: "Zach", last_name: "Downs", email: "zxd4321@rit.edu")

#No depends
load 'db/seeds/districts.rb'

#Depends
load 'db/seeds/schools' #depends on districts