class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :genre
  belongs_to :item_condition
  belongs_to :shipping_fee
  belongs_to :shipping_period
  belongs_to :prefecture
  has_one :purchase

  has_one_attached :image
  has_one :purchase

  has_many :item_tag_relations
  has_many :tags, through: :item_tag_relations

end
