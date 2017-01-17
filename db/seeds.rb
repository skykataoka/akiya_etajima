#csvデータを入れる実験
require "csv"

CSV.foreach('db/akiya_lists_for_demoday.csv') do |row|
  House.create(address: row[0],
              title: row[0],
              expenses_status: row[1],
              price: row[2],
              note: row[3],
              release_status: row[4], #  0 => "賃貸", 2 => "売買", 3 => "両方"
              structure: row[5],
              scale: row[6],
              construction: row[7],
              toilet: row[8])
end




10.times do
  email = Faker::Internet.email
  password = "password"
  User.create!(
                email: email,
                password: password,
                password_confirmation: password
  )
end



26.times do |i|
  house_id = i+1
  content = Yoshida::Text.sentences(10).join
  Article.create!(
    house_id: house_id,
    content: content
  )
end


26.times do
  article_id = [*1..26].sample
  avator = Faker::Avatar.image
  Image.create!(
    article_id: article_id,
    avator: avator
  )
end

26.times do
  user_id = [*1..10].sample
  house_id = [*1..26].sample
  content = Yoshida::Text.sentence
  Comment.create!(
    user_id: user_id,
    house_id: house_id,
    content: content
  )
end

26.times do
  user_id = [*1..10].sample
  house_id = [*1..26].sample
  Favorite.create!(
    user_id: user_id,
    house_id: house_id
  )
end