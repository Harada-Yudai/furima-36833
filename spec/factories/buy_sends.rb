FactoryBot.define do
  factory :buy_send do
    postcode { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    block { '1-1' }
    building { '東京ハイツ' }
    phone_num { '12345678900' }
  end
end
