# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u1 = User.create(:first_name => "Stefan", :last_name => "Stavsson", :email => "stefan@test.nu", :password => "Hello")
u2 = User.create(:first_name => "Joel", :last_name => "Karlsson", :email => "josel@test.nu", :password => "Hello")