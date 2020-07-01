class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart

  helper_method :current_user, :current_admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  private

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end

  def love_tacos
    @taco_tasty = true
  end
  
  def so_many_tacos
    three_tacos = "taco taco taco"
  end

  def no_tacos
    tacos = nill
  end
end
