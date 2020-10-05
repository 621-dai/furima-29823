FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"123abc"}
    password_confirmation {password}
    first_name            {"鈴木"}
    last_name             {"太郎"}
    first_name_kana       {"スズキ"}
    last_name_kana        {"タロウ"}
  end
end