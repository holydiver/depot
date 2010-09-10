class StoreController < ApplicationController
  skip_before_filter :authorize

  def index
    @products = Product.all
    @cart = current_cart
    @current_time = Time.now.strftime("%m-%d-%Y %H:%M:%S")

    if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] += 1
    end

    @counter = session[:counter]
  end
end
