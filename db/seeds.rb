User.create!(name:  "Geoff Ramler",
             email: "geoffrey.ramler@gmail.com",
             password:              "Fri$cit!6grunt",
             password_confirmation: "Fri$cit!6grunt",
             admin: true)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password:              password,
               password_confirmation: password)
end
