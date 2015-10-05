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
load 'db/seeds/evaluation_types.rb'
load 'db/seeds/rating_types.rb'


#Depends
load 'db/seeds/schools.rb' #depends on districts
load 'db/seeds/students.rb' #depends on school
load 'db/seeds/teachers.rb' #depends on school
load 'db/seeds/school_classes.rb' #depends on school and teacher
load 'db/seeds/evaluation_templates.rb' #depends on school_class, rating_type, and evaluation_type
load 'db/seeds/evaluations.rb' #depends on evaluations template
load 'db/seeds/ratings.rb' #depends on evaluation and student
