class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end


  private
  def item_params
    parems.require(:item).permit(:name, :comment, :category_id, :status_id, :fee_id, :area_id, :days_id, :price, :user)
  end

end
