users = User.create!(name: "Example User",
             email: "example@railstutorial.org",
             password: "123123",
             password_confirmation: "123123",
             admin: true)
User.create!(name: "Dương Nguyễn",
             email: "duong@gmail.com",
             password: "123123",
             password_confirmation: "123123",
             admin: true)

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end
