# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create({ :email => 'mothore@gmail.com', :password => 'password', :admin => true, :full_name => 'Michael Minter', :cell_phone => '15125797931', :active => true })

LocationGroup.create({ :order => 1, :name => 'work' })
LocationGroup.create({ :order => 2, :name => 'school' })
LocationGroup.create({ :order => 3, :name => 'social' })
LocationGroup.create({ :order => 4, :name => 'financial' })

Location.create({ :name => 'github', :badge => '/assets/locations/github.gif', :location_group_id => 3 })
