class BuyRecordsController < ApplicationController
  before_action :authenticate_user!,only:[:index, :create]
  before_action :item_find, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create] 

  def index
    @buy_record_delivery = BuyRecordDelivery.new
  end

  def create
    @buy_record_delivery = BuyRecordDelivery.new(buy_record_params)
    if @buy_record_delivery.valid?
      @buy_record_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_find
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if @item.user.id == current_user.id
  end

  def buy_record_params
    params.require(:buy_record_delivery).permit(:post_number, :prefecture_id, :city, :address_number, :building_name, :phone_number).merge(user_id: current_user.id,item_id: @item.id)
  end

end
