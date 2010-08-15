class StoreController < ApplicationController
  def index
    @products = Product.all
    @current_time = Time.now.strftime("%m-%d-%Y %H:%M:%S")
  end
end
