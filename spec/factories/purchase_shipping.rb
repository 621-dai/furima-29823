FactoryBot.define do
  factory :purchase_shipping do
    user_id            { Faker::Number.number }
    item_id            { Faker::Number.number }
    postal_code        { '000-0000' }
    prefecture_id      { Faker::Number.number }
    city               { Faker::Address.city }
    street_name        { Faker::Address.street_name }
    building           { Faker::String.random }
    purchase_id        { Faker::Number.number }
    phone_number       { Faker::Number.number }
    token              { Faker::String.random }
  end
end