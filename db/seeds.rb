# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  Role.delete_all

  Role.create!(:role => "member")

  Role.create!(:role => "owner")

  Membership.delete_all
  User.delete_all

  20.times {User.create!(:first_name => Faker::Name.first_name,
                  :last_name => Faker::Name.last_name,
                  :email => Faker::Internet.email,
                  :password_digest => "test")}
