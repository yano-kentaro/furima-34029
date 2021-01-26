FactoryBot.define do
  factory :user do
    first_name            {Faker::gimei.first.kanji}
    first_name_kana       {Faker::gimei.first.katakana}
    last_name             {Faker::gimei.last.kanji}
    last_name_kana        {Faker::gimei.last.katakana}
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end