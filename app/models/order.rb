#Formオブジェクト
class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :phone_number, numericality:  {only_integer: true}
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    @purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_number: street_number, phone_number: phone_number, building_name: building_name, purchase_id: @purchase.id)
  end
end