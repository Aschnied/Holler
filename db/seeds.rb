require 'faker'
require 'securerandom'

10.times do
  User.create(user_handle: Faker::Internet.user_name, full_name: Faker::Name.name, email: Faker::Internet.safe_email, password: SecureRandom.hex(4))
end

40.times do
  Holler.create(content: Faker::Lorem.sentence[0..19], user_id: rand(1..9))
end
