class SessionsController < ApplicationController
  def new
    # Este método solo muestra el formulario de inicio de sesión
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      
      # Asegurarte de que el usuario tenga un carrito
      cart = Cart.find_or_create_by(user_id: user.id)
      session[:cart_id] = cart.id  # Guardar el ID del carrito en la sesión

      redirect_to home_path, notice: 'Has iniciado sesión exitosamente.'
    else
      flash.now[:alert] = 'Email o contraseña incorrectos'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    session[:cart_id] = nil  # Asegúrate de limpiar también el ID del carrito en la sesión
    redirect_to root_path, notice: 'Has cerrado sesión.'
  end
end
