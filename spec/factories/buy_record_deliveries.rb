FactoryBot.define do
  factory :buy_record_delivery do
    post_number {'000-0000'}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city {'横浜市'}
    address_number {'1-1-1'}
    building_name {Faker::Name}
    phone_number {Faker::Number.number(digits: 11)}
    token {'tok_abcdefghijklmn00000000000000'}
  end
end
