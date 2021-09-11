class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def index
    @items = Item.all.order("created_at DESC")
    #@items = ''
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def item_params
    params.require(:item).permit(:name, :comment, :category_id, :status_id, :fee_id, :area_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

end
