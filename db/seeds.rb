CSV.foreach('db/akiya_lists_for_demoday.csv') do |row|
  House.create(address: row[0],
              expenses_status: row[1],
              price: row[2],
              note: row[3],
              release_status: row[4], #  0 => "賃貸", 2 => "売買", 3 => "両方"
              structure: row[5],
              scale: row[6],
              construction: row[7],
              toilet: row[8],
              title: row[9])
end


CSV.foreach('db/akiya_lists_for_demoday.csv') do |row|
  num = $.
  Article.create(house_id: num, content: row[10])
end

27.times do
  article_id = [*1..27].sample
  avator = Faker::Avatar.image
  Image.create!(
    article_id: article_id,
    avator: avator
  )
end

27.times do
  user_id = [*1..10].sample
  house_id = [*1..27].sample
  content = Yoshida::Text.sentence
  Comment.create!(
    user_id: user_id,
    house_id: house_id,
    content: content
  )
end

27.times do
  user_id = [*1..10].sample
  house_id = [*1..27].sample
  Favorite.create!(
    user_id: user_id,
    house_id: house_id
  )
end