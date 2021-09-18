class RecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_record, only: [:index, :create]
  before_action :move_to_root_path, only: [:index]

  def index
    @record_address = RecordAddress.new
  end

  def create
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
      pay_item
      @record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  def move_to_root_path
    if @item.user == current_user || @item.record.present?
      redirect_to root_path
    end
  end

  private

  def record_params
    params.require(:record_address).permit(:postal_code, :area_id, :municipalities, :house_number, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_record
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price],  # 商品の値段
        card: record_params[:token],
        currency: 'jpy'
      )
  end

end
