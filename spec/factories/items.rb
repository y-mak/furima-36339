FactoryBot.define do
  factory :item do
    name                  { 'スマートフォン' }
    comment               { '2010年頃に購入した中古品です。キズはほとんどありません。' }
    category_id           { '3' }
    status_id             { '5' }
    fee_id                { '2' }
    area_id               { '34' }
    shipping_day_id       { '4' }
    price                 { '4500' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end