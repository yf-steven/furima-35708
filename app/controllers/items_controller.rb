class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_record_find, only: [:show, :destroy, :edit, :update]
  before_action :move_to_index, only: [:destroy, :edit, :update]

  def index
    @items = Item.includes(:user).order(created_at: 'DESC')
    @buy_records = BuyRecord.includes(:user, :item)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  def show
    @buy_record = BuyRecord.new
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_record_find
    @item = Item.find(params[:id])
    @buy_records = BuyRecord.find_by(item_id: @item.id)
  end

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :cost_who_id, :post_from_id, :days_to_post_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def move_to_index

    if current_user.id != @item.user.id || @buy_records.present?
      redirect_to root_path
    end 
  end
end
