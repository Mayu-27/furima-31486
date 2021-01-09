class Order
  include ActiveModel::Model
  attr_accessor :card-number, :card-exp-month, :card-exp-year, :card-cvc, :postal-code, :prefecture, :city, :addresses, :building, :phone-number

  has_one :shipping_address
  belongs_to :item

  with_options presence: ture do
    valdiates: card-number:  {only_integer: true}
    validates: card-exp-month: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 12}
    valdiates: card-exp-year: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 99}
    validates: :card-cvc: {only_integer: true, length: {maximum: 4}
    validates: postal-code, {format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    valdiates: prefecture: {numericality: { other_than: 1 }}
    valdiates: city
    validates: addresses
    valdiates: building
    validates: phone-number: {only_integer: true}


    def save

    end
end