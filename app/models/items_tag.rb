class ItemsTag

  include ActiveModel::Model
  attr_accessor :tag_name, :name, :image, :introduction, :genre_id, :item_condition_id, :shipping_fee_id, :shipping_period_id, :prefecture_id, :price, :user_id

  with_options presence: true do
    validates :name
    validates :introduction
    validates :image
    validates :tag_name
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :genre_id
    validates :item_condition_id
    validates :shipping_fee_id
    validates :shipping_period_id
    validates :prefecture_id
  end

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }


  def save
    item = Item.create(name: name, introduction: introduction, genre_id: genre_id, item_condition_id: item_condition_id, shipping_fee_id: shipping_fee_id, shipping_period_id: shipping_period_id, prefecture_id: prefecture_id, price: price, user_id: user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save

    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end

end