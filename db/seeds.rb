10.times do
  email = Faker::Internet.email
  name = Faker::Name.name
  password = "password"
  status = false
  User.create!(
               name: name,
               email: email,
               password: password,
               password_confirmation: password,
               status: status
  )
end

20.times do
  address = Faker::Address.state + Faker::Address.city
  latitude = Faker::Address.latitude
  longitude = Faker::Address.longitude
  tel = Faker::PhoneNumber.cell_phone
  email = Faker::Internet.email
  title = Yoshida::Text.word
  description = Yoshida::Text.sentence
  House.create!(
               address: address,
               latitude: latitude,
               longitude: longitude,
               tel: tel,
               email: email,
               title: title,
               description: description
  )
end

20.times do |i|
  house_id = i+1
  content = Yoshida::Text.sentences(10).join
  Article.create!(
    house_id: house_id,
    content: content
  )
end

20.times do
  user_id = [*1..10].sample
  house_id = [*1..20].sample
  content = Yoshida::Text.sentence
  Comment.create!(
               user_id: user_id,
               house_id: house_id,
               content: content
  )
end

20.times do
  user_id = [*1..10].sample
  house_id = [*1..20].sample
  Favorite.create!(
    user_id: user_id,
    house_id: house_id
  )
end

