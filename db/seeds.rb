# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create users
puts 'Seeding database'
puts 'Creating users'
user1 = User.create!(
  email: 'a@a.com',
  password: 'asdf'
)

user2 = User.create!(
  email: 'b@b.com',
  password: 'qwer'
)

user3 = User.create!(
  email: 'c@c.com',
  password: 'zxcv'
)

user4 = User.create!(
  email: 'd@d.com',
  password: '1234'
)

user5 = User.create!(
  email: 'e@e.com',
  password: '4567'
)

user6 = User.create!(
  email: 'f@f.com',
  password: '7890'
)
puts "Users created"

# Create urls
puts 'Creating URLs'
Url.create!(
  short_url: 'b2xVn2',
  long_url: 'http://www.lighthouselabs.ca',
  user: user1
)

Url.create!(
  short_url: '9sm5xK',
  long_url: 'http://www.google.com',
  user: user2
)

Url.create!(
  short_url: 'q2evqwzpg3',
  long_url: 'http://www.youtube.com',
  user: user3
)

Url.create!(
  short_url: 'au8lus7d05',
  long_url: 'http://www.wikipedia.com',
  user: user4
)

Url.create!(
  short_url: 'nbmwdt7us2o',
  long_url: 'http://www.github.com',
  user: user5
)

Url.create!(
  short_url: 'piforyrfd',
  long_url: 'http://www.outlook.com',
  user: user6
)
puts 'URLs created'
puts 'Databse seeded successfully'