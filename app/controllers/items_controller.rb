class ItemsController < ApplicationController
  before_action :authenticate_user!, execpt: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all.order(created_at: :desc)
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

  def show
  end

  def edit
  end

  def update
    if @item.update(set_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def set_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :item_condition_id, :shipping_fee_id, :prefecture_id,
                                 :shipping_period_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @item.user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
