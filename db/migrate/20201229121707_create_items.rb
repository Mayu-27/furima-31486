class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,               null: false, default: ""
      t.text :introduction,         null: false
      t.integer :genre_id,          null: false
      t.integer :item_condition_id, null: false
      t.integer :shipping_fee_id,   null: false
      t.integer :prefecture_id,     null: false
      t.integer :shipping_period_id,null: false
      t.integer :price,             null: false
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end