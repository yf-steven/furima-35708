class ItemsController < ApplicationController
  before_action :basic_auth
  before_action :login_check,only: [:new]

  def index
  end

  def new
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def login_check
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
