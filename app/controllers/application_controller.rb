class ApplicationController < ActionController::Base
    helper_method :current_user

    helper_method :current_cart

    def after_sign_in_path_for(resource)
      # Asegurarte de que el usuario tenga un carrito
      @cart = Cart.find_or_create_by(user_id: resource.id)
      session[:cart_id] = @cart.id
  
      super
    end

  private

  def current_cart
    @current_cart ||= Cart.find_by(id: session[:cart_id]) || Cart.create
    session[:cart_id] = @current_cart.id
    @current_cart
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
