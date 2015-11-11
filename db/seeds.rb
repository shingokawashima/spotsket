# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

c1 = Company.create(name: 'c1', email: 'c1@dot.com', password: 'hogehoge')

s1 = Student.create(name: 's1', email: 's1@dot.com', password: 'hogehoge')
