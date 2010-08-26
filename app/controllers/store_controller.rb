class StoreController < ApplicationController
  def index
    @products = Product.all
    @cart = current_cart
    @current_time = Time.now.strftime("%m-%d-%Y %H:%M:%S")
  end
end
