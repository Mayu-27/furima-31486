require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '新規登録できるとき' do
      it 'image, name, introduction,genre_id,item_condition_id,prefecture_id,shipping_fee_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'nameが空では登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'introductionが空では登録できない' do
        @item.introduction = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end
      it 'genre_idが空では登録できない' do
        @item.genre_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品ジャンルを入力してください")
      end
      it 'item_condition_idが空では登録できない' do
        @item.item_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it 'shipping_fee_idが空では登録できない' do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it 'shipping_period_idが空では登録できない' do
        @item.shipping_period_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("配送までの日数を入力してください")
      end
      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end
      it 'priceが半角数字でないと登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end
      it 'priceが半角英語だけでは登録できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end
      it 'priceが¥300~¥9,999,999の間でないと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は300以上の値にしてください')
      end
      it 'priceが¥300~¥9,999,999の間でないと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は9999999以下の値にしてください')
      end
      it 'genre_idが1以上でないと登録できない' do
        @item.genre_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('商品ジャンルは1以外の値にしてください')
      end
      it 'item_condition_idが1以上でないと登録できない' do
        @item.item_condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態は1以外の値にしてください')
      end
      it 'shipping_fee_idが1以上でないと登録できない' do
        @item.shipping_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担は1以外の値にしてください')
      end
      it 'shipping_period_idが1以上でないと登録できない' do
        @item.shipping_period_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('配送までの日数は1以外の値にしてください')
      end
      it 'prefecture_idが1以上でないと登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域は1以外の値にしてください')
      end
    end
  end
end
