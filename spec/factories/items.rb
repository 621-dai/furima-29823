FactoryBot.define do
  factory :item do
    name                       { Faker::Name.name }
    introduction               { Faker::String.random }
    user_id                    { Faker::Number.number }
    category_id                { Faker::Number.number }
    condition_id               { Faker::Number.number }
    shipping_cost_id           { Faker::Number.number }
    prefecture_id              { Faker::Number.number }
    estimated_shipping_date_id { Faker::Number.number }
    price                      { Faker::Number.between(from: 300, to: 9,999,999) }
  end
end
