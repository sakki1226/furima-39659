class OrdersController < ApplicationController
  before_action : , only: [:index]
  before_action :move_to_index, only: [:index]

  
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id]) 
  end

  def create
    @item = Item.find(params[:item_id]) 
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :street, :building, :phone, :item_id, :user_id).merge(user_id: current_user.id, item_id: @item.id)
  end

  def move_to_index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id]) 
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

end
