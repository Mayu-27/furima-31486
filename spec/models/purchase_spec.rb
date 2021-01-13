require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end

  describe '商品購入機能' do
    context '購入できるとき' do
      it 'user_id,item_idが存在すれば登録できる' do
        expect(@purchase).to be_valid
      end
    end

    context '購入できないとき' do
      it 'user_idが空では登録できない' do
        @purchase.user_id = nil 
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User must exist")
      end
      it 'item_idが空では登録できない' do
        @purchase.item_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Item must exist")
      end
    end
  end
end
