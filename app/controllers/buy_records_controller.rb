class BuyRecordsController < ApplicationController
  before_action :authenticate_user!,only:[:index, :create]
  before_action :item_record_find, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create] 

  def index
    @buy_record_delivery = BuyRecordDelivery.new
  end

  def create
    @buy_record_delivery = BuyRecordDelivery.new(buy_record_params)
    if @buy_record_delivery.valid?
      pay_item
      @buy_record_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_record_find
    @item = Item.find(params[:item_id])
    @buy_record = BuyRecord.find_by(item_id: @item.id)
  end

  def move_to_index
    if @item.user.id == current_user.id || @buy_record.present?
      redirect_to root_path 
    end
  end

  def buy_record_params
    params.require(:buy_record_delivery).permit(:post_number, :prefecture_id, :city, :address_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: buy_record_params[:token],
        currency: 'jpy'
      )
  end

end
