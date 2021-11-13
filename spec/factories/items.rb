FactoryBot.define do
  factory :item do
    name                  { 'test' }
    info                  { 'test,test'}
    category_id           { 2 }
    status_id             { 2 }
    ship_pay_id           { 2 }
    prefecture_id         { 1 }
    ship_day_id           { 2 }
    price                 { 1000 }
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
