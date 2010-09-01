class StoreController < ApplicationController
  skip_before_filter :authorize

  def index
    @products = Product.all
    @cart = current_cart
    @current_time = Time.now.strftime("%m-%d-%Y %H:%M:%S")
  end
end
