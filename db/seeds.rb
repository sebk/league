# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

u1 = User.create(:name => "Roman", :email => "rl@gobas.de", :password => "asdasd", :password_confirmation => "asdasd")
u2 = User.create(:name => "Sebastian", :email => "sek@gobas.de", :password => "asdasd", :password_confirmation => "asdasd")

#t3 = Multiplayerteam.create(:name => "Seb und Roman 2un2 Kicker")
#t3.teammemberships.create(:user => u1)
#t3.teammemberships.create(:user => u2)





l1 = Ladder.create(:name => "1on1 Kicker Liga Gobas intern")
l2 = Ladder.create(:name => "2on2 Kicker Liga Gobas intern")


#u1.singleplayerteam.joins(l1)
#u2.singleplayerteam.joins(l1)


#t3.joins(l2)


