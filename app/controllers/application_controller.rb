class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery

  private

    def current_cart
      Cart.find(session[:cart_id])
    rescue
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

  protected

    def authorize
      if User.count == 0
        if !(request.path_parameters[:controller] == 'users' and (request.path_parameters[:action] == 'new' or request.path_parameters[:action] == 'create'))
          redirect_to :controller => 'users', :action => 'new'
        end
      else
        unless User.find_by_id(session[:user_id]) 
          redirect_to login_url, :notice => "Please log in"
        end
      end
    end
end
