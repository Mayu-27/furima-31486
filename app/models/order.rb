#Formオブジェクト
class Order
  include ActiveModel::Model
  attr_accessor :card_number, :card_exp_month, :card_exp_year, :card_cvc, :postal_code, :prefecture, :city, :addresses, :building, :phone_number


  with_options presence: true do
    validates :card_number, numericality: {only_integer: true}
    validates :card_exp_month, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 12}
    validates :card_exp_year, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 99}
    validates :card_cvc, numericality: {only_integer: true, length: {maximum: 4}}
    validates :postal_code, format: {with: /\A[0_9]{3}_[0_9]{4}\z/}
    validates :prefecture, numericality: { other_than: 1 }
    validates :city
    validates :addresses
    validates :building
    validates :phone_number, numericality:  {only_integer: true}
  end

  def save
    order = Order.create(card_number: card_number, card_exp_month: card_exp_month, card_exp_year: card_exp_year, card_cvc: card_cvc, user_id: user_id)
    ShippingAddresses.create(postal_code: postal_code, prefecture: prefecture, city: city, building: building, user_id: user.id)
  end
end
