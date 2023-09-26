class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
      if @item.save?
        redirect_to root_path        
      else
        render :new, status: :unprocessable_entity
      end
  end

  def item_params
    params.require(:item).permit(:item_name, :price, :explanation, :category_id, :condition_id, :postage_id, :prefecture_id, :delivery_day_id, :image).merge(user_id: current_user.id)
  end
  
end
