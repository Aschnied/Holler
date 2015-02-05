10.times do
  User.new(user_name: Faker::Internet.user_name, full_name: Faker::Name.name, email: Faker::Internet.safe_email)
end

40.times do
  Tweet.new(content: Faker::Hacker.say_something_smart[0..19], user_id: rand(1..9))
end
