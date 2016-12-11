# 10.times do
#   email = Faker::Internet.email
#   name = Faker::Name.name
#   password = "password"
#   status = false
#   User.create!(
#                name: name,
#                email: email,
#                password: password,
#                password_confirmation: password,
#                status: status
#   )
# end