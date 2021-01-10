class Purchase < ApplicationRecord
  has_one :shipping_address
  belongs_to :order
  belongs_to :user
end
