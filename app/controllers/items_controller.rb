class ItemsController < ApplicationController
  before_action :basic_auth
  before_action :authenticate_user!,only: [:new, :create]
  
  def index
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
  
  private
  
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
  
  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :cost_who_id, :post_from_id, :days_to_post_id, :price, :image).merge(user_id: current_user.id)
  end 
end
