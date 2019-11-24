# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# puts 'creating groups'

# 5.times do
#   group = Group.new(
#     name: Faker::Team.unique.name
#   )
#   group.save!
# end

# puts 'creating users'

# 50.times do
#   user = User.new(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.free_email,
#     encrypted_password: Faker::Internet.password,
#     group_id: Group.all.ids.sample,
#     password: "$2a$10$5eoHh6M2q4GjGkHClO.NqebWWhS94D8rNj5Ot6CB2qrbn7IrTfkSa",
#     reset_password_token: nil,
#     reset_password_sent_at: nil,
#     remember_created_at: nil,
#   )
#   user.save!
# end

puts 'adding users to group'
10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    password: "$2a$10$5eoHh6M2q4GjGkHClO.NqebWWhS94D8rNj5Ot6CB2qrbn7IrTfkSa",
    reset_password_token: nil,
    reset_password_sent_at: nil,
    remember_created_at: nil,
    group_id: 49,
    user_status: ["pending", "approved"].sample
  )
  user.save!
end
