FactoryBot.define do
  factory :user do
    first_name            { Gimei.name.first.kanji }
    first_name_kana       { Gimei.name.first.katakana }
    last_name             { Gimei.name.last.kanji }
    last_name_kana        { Gimei.name.last.katakana }
    nickname              { Faker::Name.initials(number: 2) }
    birth_date            { Faker::Date.birthday }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 10, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
  end
end
