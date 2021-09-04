class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    #Item.create(item_params)
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def item_params
    params.require(:item).permit(:name, :comment, :category_id, :status_id, :fee_id, :area_id, :days_id, :price, :image).merge(user_id: current_user.id)
  end

end
