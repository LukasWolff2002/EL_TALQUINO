class HomeController < ApplicationController
    def welcome
        # No necesitas autenticar usuario aquí porque es la entrada a la app
        @products = Product.all
    end

    before_action :authenticate_user, only: [:index]

    def index
        @products = Product.all
        @current_cart = current_cart
        # La acción para mostrar la página de inicio ya tiene acceso a current_user gracias al helper_method
    end

    private

    def authenticate_user
        redirect_to login_path unless current_user
    end
end