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

    def request_is_for_creating_user
      params = request.path_parameters
      if params[:controller] == 'users'
        params[:action] == 'new' or params[:action] == 'create'
      else
        false      
      end
    end

  protected

    def authorize
      if User.count == 0
        if !request_is_for_creating_user
          redirect_to :controller => 'users', :action => 'new'
        end
      else
        unless User.find_by_id(session[:user_id]) 
          redirect_to login_url, :notice => "Please log in"
        end
      end
    end
end
