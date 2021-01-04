class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(set_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :item_condition_id, :shipping_fee_id, :prefecture_id,
                                 :shipping_period_id, :price).merge(user_id: current_user.id)
  end
end
