# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ticket = TicketStatus.create(:status_name => "Bugg")
ticket2 = TicketStatus.create(:status_name => "Ny feature")
ticket3 = TicketStatus.create(:status_name => "Todo")
ticket4 = TicketStatus.create(:status_name => "Stangd")