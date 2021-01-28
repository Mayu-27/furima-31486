FactoryBot.define do
  factory :order do
    user_id             { FactoryBot.create(:user).id }
    item_id             { FactoryBot.create(:item).id }
    postal_code         { '111-1111' }
    prefecture_id       { '2' }
    city                { '横浜市緑区' }
    street_number       { '青山11-1' }
    phone_number        { '09012345678' }
    token               { 'tok_abcdefghijk00000000000000000' }
  end
end
