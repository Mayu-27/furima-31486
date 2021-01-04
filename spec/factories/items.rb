FactoryBot.define do
  factory :item do
    name                {Faker::Lorem.sentence}
    introduction        {Faker::Lorem.sentence}
    genre_id            {"1"}
    item_condition_id   {"1"}
    shipping_fee_id     {"1"}
    prefecture_id       {"1"}
    shipping_period_id  {"1"}
    price               {"1000"}
    user_id             { FactoryBot.create(:user).id } 
  end
end
