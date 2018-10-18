User.create!(name:  "Geoff Ramler",
             email: "geoffrey.ramler@gmail.com",
             password:              "Fri$cit!6grunt",
             password_confirmation: "Fri$cit!6grunt",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Example User",
             email: "user@example.com",
             password:              "Password1",
             password_confirmation: "Password1",
             activated: false,
             activated_at: Time.zone.now)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "Password1"
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

# Following relationships.
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
