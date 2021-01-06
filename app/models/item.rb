class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :genre
  belongs_to :item_condition
  belongs_to :shipping_fee
  belongs_to :shipping_period
  belongs_to :prefecture    

  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :introduction
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :genre_id
    validates :item_condition_id
    validates :shipping_fee_id
    validates :shipping_period_id
    validates :prefecture_id
  end

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
