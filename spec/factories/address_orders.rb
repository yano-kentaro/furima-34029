FactoryBot.define do
  factory :address_order do
    token               { Faker::Lorem.sentence }
    postcode            { '123-4567' }
    prefecture_id       { Faker::Number.between(from: 2, to: 48) }
    city                { Faker::Address.city }
    address_line_1      { Faker::Address.street_address }
    address_line_2      { Faker::Address.building_number }
    phone_number        { Faker::Number.between(from: 1_000_000_000, to: 99_999_999_999) }
  end
end
