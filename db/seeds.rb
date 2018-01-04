User.create!(name:  "Geoff Ramler",
             email: "geoffrey.ramler@gmail.com",
             password:              "Fri$cit!6grunt",
             password_confirmation: "Fri$cit!6grunt",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Example User",
             email: "user@example.com",
             password:              "password",
             password_confirmation: "password",
             activated: false,
             activated_at: Time.zone.now)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)

50.times do |n|
  content = "Grunt \##{n+1}"
  users.each { |user| user.microposts.create!(content: content) }
end
