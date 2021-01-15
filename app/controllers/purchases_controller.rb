class PurchasesController < ApplicationController
  def index
    @order = Order.new
  end

  def create
    @order = Order.new(set_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else 
      render :index
    end
  end

  private
  def set_params
    params.require(:order).permit(:card_number, :card_exp_month, :card_exp_year, :card_cvc, :postal_code, :prefecture_id, :city, :street_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end


 