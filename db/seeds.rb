# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  #Role.delete_all

  #Role.create!(:role => "member")
  #Role.create!(:role => "owner")

  User.delete_all
  Project.delete_all
  Task.delete_all
  Comment.delete_all
  Membership.delete_all

  admin = User.create!(
  first_name: 'Admin',
  last_name: 'User',
  email: 'admin@example.com',
  password: 'password',
  admin: true
  )

  owner = User.create!(
  first_name: 'Owner',
  last_name: 'User',
  email: 'owner@example.com',
  password: 'password',
  )

  member = User.create!(
  first_name: 'Member',
  last_name: 'User',
  email: 'member@example.com',
  password: 'password',
  )

  user = User.create!(
  first_name: 'Basic',
  last_name: 'User',
  email: 'user@example.com',
  password: 'password',
  )

  multiple_owners = Project.create!(name: 'Multiple Owners')
  Membership.create!(
  project: multiple_owners,
  user: owner,
  role_id: Role.find_by_role("owner").id
  )
  Membership.create!(
  project: multiple_owners,
  user: user,
  role_id: Role.find_by_role("owner").id
  )
  Membership.create!(
  project: multiple_owners,
  user: member,
  role_id: Role.find_by_role("member").id
  )

  task1 = Task.create!(
  description: "Write 3 comments",
  project: multiple_owners,
  due_date: 4.days.from_now
  )

  task2 = Task.create!(
  description: "Write 1 comment",
  project: multiple_owners,
  due_date: 5.days.from_now
  )

  3.times do
    Comment.create!(
    task: task1,
    user: owner,
    comment: Faker::Lorem.sentence
    )
  end

  Comment.create!(
  task: task2,
  user: member,
  comment: Faker::Lorem.sentence
  )

  single_owner = Project.create!(name: 'Single Owner')
  Membership.create!(
  project: single_owner,
  user: owner,
  role_id: Role.find_by_role("owner").id
  )
  Membership.create!(
  project: single_owner,
  user: member,
  role_id: Role.find_by_role("member").id
  )
