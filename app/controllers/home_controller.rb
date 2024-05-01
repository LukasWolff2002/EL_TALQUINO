class HomeController < ApplicationController
    def welcome
        # No necesitas autenticar usuario aquí porque es la entrada a la app
    end

    before_action :authenticate_user, only: [:index]

    def index
        # La acción para mostrar la página de inicio ya tiene acceso a current_user gracias al helper_method
    end

    private

    def authenticate_user
        redirect_to login_path unless current_user
    end
end