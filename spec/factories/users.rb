FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'zxc123' }
    password_confirmation { password }
    last_name             { 'あああ' }
    first_name            { 'あああ' }
    last_kana             { 'アアア' }
    first_kana            { 'アアア' }
    birthday              { '1930-01-01' }
  end
end
