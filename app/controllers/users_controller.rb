class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
      @user = User.new(user_params)
      if @user.save
        # Crear carrito después de guardar el usuario
        @cart = Cart.create(user_id: @user.id)
        session[:cart_id] = @cart.id
        redirect_to home_path, notice: "Usuario creado exitosamente y carrito iniciado."
      else
        render :new
      end
    end

    private
        def user_params
            params.require(:user).permit(:username, :email, :password)
        end
end