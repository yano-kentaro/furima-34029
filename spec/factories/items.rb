FactoryBot.define do
  factory :item do
    name                      { Faker::Lorem.word }
    explanation               { Faker::Lorem.word }
    price                     { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id               { Faker::Number.between(from: 2, to: 11) }
    condition_id              { Faker::Number.between(from: 2, to: 7) }
    shipping_charge_id        { Faker::Number.between(from: 2, to: 3) }
    prefecture_id             { Faker::Number.between(from: 2, to: 48) }
    delivery_date_id          { Faker::Number.between(from: 2, to: 4) }
    association :user
    after(:build) do |message|
      message.image.attach(io: File.open('app/assets/images/search.png'), filename: 'search.png')
    end
  end
end
