FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '123abc' }
    password_confirmation { '123abc' }
    first_name            { '鈴木' }
    last_name             { '太郎' }
    first_name_kana       { 'スズキ' }
    last_name_kana        { 'タロウ' }
    birthday              { '1999-08-08' }
  end
end
