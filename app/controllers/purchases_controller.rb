class PurchasesController < ApplicationController
  def index
    @order = Order.new
  end

  def create
    binding.pry
  end
end