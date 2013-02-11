# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

project = Project.create(:user_id => 2, :title => "testprojekt", :description => "Testdesjklkljcription", :start_date => "2012-04-21", :end_date => "2013-05-23")

pu = Projects_users.create(:user_id => 8, :project_id => 6)
pu2 = Projects_users.create(:user_id => 9, :project_id => 6)
pu3 = Projects_users.create(:user_id => 10, :project_id => 6)
pu4 = Projects_users.create(:user_id => 11, :project_id => 6)
pu5 = Projects_users.create(:user_id => 12, :project_id => 6)