# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "aaa@aaa",
  password: "aaaaaa")


10.times do |n|
    Customer.create!(
      email: "test#{n + 1}@test.com",
      name: "名#{n + 1}",
      surname: "姓#{n + 1}",
      name_kana: "セイ",
      surname_kana: "メイ",
      password: "123456",
      postal_code: "1234567",
      address: "東京都渋谷区神南1丁目19-11 パークウェースクエア2 4階#{n + 1}",
      phone_number: "09012345678"
    )
end

Genre.create!(
  name:"個売りケーキ"
)

Genre.create!(
  name:"ホールケーキ"
)

Genre.create!(
  name:"シュークリーム"
)

Genre.create!(
  name:"エクレア"
)

Genre.create!(
  name:"クッキー"
)

Genre.create!(
  name:"チョコレート"
)

Product.create!(
    name: "ショートケーキ",
    introduction: "いちごたくさんのショートケーキ！",
    price: "500",
    genre_id: 1,
    is_active: [['販売中', true], ['販売停止', false]],
    image_id: open("./app/assets/images/shortcake.jpg")
  )

Product.create!(
    name: "チョーコレーとケーキ(ホール)",
    introduction: "ホールのチョコケーキにたくさんのベリーをのせました",
    price: "2800",
    genre_id: 2,
    is_active: [['販売中', true], ['販売停止', false]],
    image_id: open("./app/assets/images/choco-cake.jpeg")
  )

Product.create!(
    name: "おおきなシュークリーム",
    introduction: "大きな大きなシュークリーム",
    price: "220",
    genre_id: 3,
    is_active: [['販売中', true], ['販売停止', false]],
    image_id: open("./app/assets/images/shu.jpeg")
  )

Product.create!(
    name: "チョコエクレア",
    introduction: "高級感たっぷりの店の看板商品",
    price: "240",
    genre_id: 4,
    is_active: [['販売中', true], ['販売停止', false]],
    image_id: open("./app/assets/images/ecu.jpeg")
  )

Product.create!(
    name: "カントリーマーン",
    introduction: "カントリーマアムのパクリです！",
    price: "1000",
    genre_id: 5,
    is_active: [['販売中', true], ['販売停止', false]],

    image_id: open("./app/assets/images/can.jpeg")
  )

9.times do |n|
  ShippingAddress.create!(
    name: "test#{n + 1}",
    postal_code: "123456#{n + 1}",
    address: "東京都渋谷区神南1丁目19-11 パークウェースクエア2 4階#{n + 1}",
    customer_id: n + 1
  )
end

    image_id: open("./app/assets/images/can.jpg")
  )

# 9.times do |n|
#   ShippingAddress.create!(
#     name: "test#{n + 1}",
#     postal_code: "123456#{n + 1}",
#     address: "東京都渋谷区神南1丁目19-11 パークウェースクエア2 4階#{n + 1}",
#     customer_id: n + 1
#   )
# end


5.times do |n|
  Order.create!(
    customer_id: n + 1,
    shipping_address: "東京都渋谷区神南1丁目19-11 パークウェースクエア2 4階#{n + 1}",
    postal_code: "123456#{n + 1}",

    name: "test#{n + 1}",

    shipping_fee: "800",
    total_amount: "#{1000 + (n * 1000) +800}",
    payment_method: "クレジットカード"

  )
end

5.times do |n|
  OrderDetail.create!(
    product_id: n + 1,
    order_id: n + 1,
    quantity: n + 3,
  )
end

