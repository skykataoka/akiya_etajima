CSV.foreach('db/akiya_lists_for_demoday.csv') do |row|
  House.create(address: row[0],
              expenses_status: row[1],#  0 => "賃貸", 1 => "売買", 2 => "両方"
              price: row[2],
              note: row[3],
              release_status: row[4],
              structure: row[5],
              scale: row[6],
              construction: row[7],
              toilet: row[8],
              title: row[9])
  sleep(1)
end


CSV.foreach('db/akiya_lists_for_demoday.csv') do |row|
  num = $.
  Article.create(house_id: num, content: row[10])
end

27.times do |i|
  article_id = i + 1
  img_base = "http://paiko817.xsrv.jp/akiya_data/"
  i += 1
  img_base2 = img_base + sprintf("%04d",i).to_s + "/"
  7.times do |num|
    imag_num = sprintf("%04d",num).to_s
    avator = img_base2 + imag_num + ".jpg"
    Image.create!(
      article_id: article_id,
      avator: avator
    )
  end
  avator = img_base2 + 'm_0001' + ".jpg"
  Image.create!(
    article_id: article_id,
    avator: avator
  )
end

User.create!(name: "事務局", email: "etajima@akiya.com", password: ENV['ADMIN_PASSWORD'], password_confirmation: ENV['ADMIN_PASSWORD'], status: 3)

# 27.times do
#   user_id = [*1..10].sample
#   house_id = [*1..27].sample
#   Favorite.create!(
#     user_id: user_id,
#     house_id: house_id
#   )
# end
