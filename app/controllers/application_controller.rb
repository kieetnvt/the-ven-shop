class ApplicationController < ActionController::Base
  protect_from_forgery

  include SessionsHelper
  def handle_unverified_request
  	sign_out
  	super
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
 
  def current_cart
  	Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
  	cart = Cart.create
  	session[:cart_id] = cart.id
    cart
  end

  def initialize_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart_id
    end
  end

end
