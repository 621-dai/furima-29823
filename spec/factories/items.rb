FactoryBot.define do
  factory :item do
    name                       { Faker::Name.name }
    user_id                    { Faker::Number.number }
    introduction               { Faker::Lorem.sentence }
    category_id                { Faker::Number.number }
    condition_id               { Faker::Number.number }
    shipping_cost_id           { Faker::Number.number }
    prefecture_id              { Faker::Number.number }
    estimated_shipping_date_id { Faker::Number.number }
    price                      { Faker::Number.between(from: 300, to: 9999999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
