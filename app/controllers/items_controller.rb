class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.includes(:user).order(created_at: 'DESC')
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
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :cost_who_id, :post_from_id, :days_to_post_id, :price,
                                 :image).merge(user_id: current_user.id)
  end
end
