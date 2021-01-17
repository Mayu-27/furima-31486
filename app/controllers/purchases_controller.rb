class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(set_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else 
      render :index
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_params
    params.require(:order).permit(:postal_code, :prefecture_id, :city, :street_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: set_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end


 