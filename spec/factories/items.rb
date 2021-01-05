FactoryBot.define do
  factory :item do
    name                { Faker::Lorem.sentence }
    introduction        { Faker::Lorem.sentence }
    genre_id            { '2' }
    item_condition_id   { '2' }
    shipping_fee_id     { '2' }
    prefecture_id       { '2' }
    shipping_period_id  { '2' }
    price               { '1000' }
    user_id             { FactoryBot.create(:user).id }
  end
end
