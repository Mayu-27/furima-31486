require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入機能' do
    context '購入できるとき' do
      it 'postal_code,prefecture_id, city, street_number, phone_numberが存在すれば保存できる' do
        expect(@order).to be_valid
      end
    end

    context '購入できないとき' do
      it 'postal_codeが空では登録できない' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'prefecture_idが1以上でないと登録できない' do
        @order.prefecture_id = '1'
        @order.valid?
        expect(@order.errors.full_messages).to include("都道府県は1以外の値にしてください")
      end
      it 'cityが空では登録できない' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'street_numberが空では登録できない' do
        @order.street_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空では登録できない' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号を入力してください")
      end

      end
    end
    
end
