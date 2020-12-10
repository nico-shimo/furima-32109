FactoryBot.define do
  factory :item_purchase do
    postal_code     { '111-1111' }
    prefecture_id   { 2 }
    city            { '鹿児島市' }
    address         { '東区１−1-３' }
    building_name   { '柳ビル' }
    phone_number    { Faker::PhoneNumber.subscriber_number(length: 11) }
    token           { 'tok_abcdefghijk00000000000000000' }
  end
end
