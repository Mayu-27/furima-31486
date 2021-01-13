#Formオブジェクト
class Order
  include ActiveModel::Model
  attr_accessor :card_number, :card_exp_month, :card_exp_year, :card_cvc, :postal_code, :prefecture_id, :city, :street_number, :building_name, :phone_number, :user_id, :item_id


  with_options presence: true do
    validates :card_number, numericality: {only_integer: true}
    validates :card_exp_month, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 12}
    validates :card_exp_year, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 99}
    validates :card_cvc, numericality: {only_integer: true, length: {maximum: 4}}
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :building_name
    validates :building_name
    validates :phone_number, numericality:  {only_integer: true}
  end

  def save
    @purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_number: street_number, phone_number: phone_number, building_name: building_name, purchase_id: @purchase.id)
  end
end