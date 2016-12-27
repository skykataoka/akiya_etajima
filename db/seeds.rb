10.times do
  email = Faker::Internet.email
  password = "password"
  User.create!(
                email: email,
                password: password,
                password_confirmation: password
  )
end

# 1 => "賃貸"
# 0 => "売買"
expenses_statuses =  [1, 0, 0, 0, nil, 0, 0, 0, 0, 0, nil, 0, 0, 0, 0, 1, 0, nil, 0, 0, 1, 1, 0, 0, 1, 0, nil, 0, 0, 1, 0, 0]
prices = [35000, 17000000, 5000000, 5000000, nil, 5000000, 13500000, 10500000, 27800000, 6000000, nil, 2000000, 1000000, 5900000, 7000000, 50000, 10800000, nil, 7000000, 5500000, 100000, 50000, 1000000, 16500000, 50000, 2500000, nil, 5500000, 10000000, 45000, 3000000, 4000000]
# true => "公開"
# false => "非公開"
release_statuses = [true, true, true, true, false, true, true, true, true, true, false, true, true, true, true, true, true, false, true, true, true, true, true, true, true, true, false, true, true, true, true, true]
titles = ["江田島市江田島町小用", "江田島市沖美町是長", "江田島市大柿町大君", "江田島市江田島町津久茂", "江田島市大柿町大原", "江田島市江田島町津久茂", "江田島市沖美町是長", "江田島市沖美町是長", "江田島市沖美町三吉", "江田島市大柿町飛渡瀬", "江田島市大柿町深江", "江田島市江田島町小用", "江田島市江田島町秋月", "江田島市能美町高田", "江田島市大柿町柿浦", "江田島市能美町鹿川", "江田島市能美町中町", "江田島市江田島町切串", "江田島市江田島町小用", "江田島市大柿町柿浦", "江田島市能美町鹿川", "江田島市沖美町岡大王", "江田島市大柿町飛渡瀬", "江田島市江田島町江南", "江田島市沖美町是長", "江田島市沖美町是長", "江田島市沖美町岡大王", "江田島市江田島町江南", "江田島市江田島町小用", "江田島市能美町高田", "江田島市大柿町柿浦", "江田島市大柿町柿浦"]
addresses = ["江田島市江田島町小用", "江田島市沖美町是長", "江田島市大柿町大君", "江田島市江田島町津久茂", "江田島市大柿町大原", "江田島市江田島町津久茂", "江田島市沖美町是長", "江田島市沖美町是長", "江田島市沖美町三吉", "江田島市大柿町飛渡瀬", "江田島市大柿町深江", "江田島市江田島町小用", "江田島市江田島町秋月", "江田島市能美町高田", "江田島市大柿町柿浦", "江田島市能美町鹿川", "江田島市能美町中町", "江田島市江田島町切串", "江田島市江田島町小用", "江田島市大柿町柿浦", "江田島市能美町鹿川", "江田島市沖美町岡大王", "江田島市大柿町飛渡瀬", "江田島市江田島町江南", "江田島市沖美町是長", "江田島市沖美町是長", "江田島市沖美町岡大王", "江田島市江田島町江南", "江田島市江田島町小用", "江田島市能美町高田", "江田島市大柿町柿浦", "江田島市大柿町柿浦"]

32.times do |i|
  tel = Faker::PhoneNumber.cell_phone
  email = Faker::Internet.email
  description = Yoshida::Text.sentence
  House.create!(
    address: addresses[i],
    tel: tel,
    email: email,
    title: titles[i],
    description: description,
    release_status: release_statuses[i],
    expenses_status: expenses_statuses[i],
    price: prices[i]
  )
end

32.times do |i|
  house_id = i+1
  content = Yoshida::Text.sentences(10).join
  Article.create!(
    house_id: house_id,
    content: content
  )
end


60.times do
  article_id = [*1..32].sample
  avator = Faker::Avatar.image
  Image.create!(
    article_id: article_id,
    avator: avator
  )
end

20.times do
  user_id = [*1..10].sample
  house_id = [*1..32].sample
  content = Yoshida::Text.sentence
  Comment.create!(
    user_id: user_id,
    house_id: house_id,
    content: content
  )
end

60.times do
  user_id = [*1..10].sample
  house_id = [*1..32].sample
  Favorite.create!(
    user_id: user_id,
    house_id: house_id
  )
end