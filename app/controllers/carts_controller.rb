class CartsController < ApplicationController

    def show
        # Encuentra el carrito usando el ID obtenido de los parámetros de la URL
        @cart = Cart.find(params[:id])
        # Puedes añadir manejo de errores aquí en caso de que el ID no sea válido
      rescue ActiveRecord::RecordNotFound
        redirect_to root_path, alert: 'Carrito no encontrado'
    end

      
    # Método para agregar un producto al carrito
    def add_product
        product = Product.find(params[:product_id])
        quantity = params[:quantity].to_i
        current_cart.add_product(product, quantity)
        
        # Opción 1: Redirigir a la página de inicio con un mensaje
        redirect_back fallback_location: root_path, notice: 'Producto añadido al carrito!'
      
        # Opción 2: Usar AJAX para una experiencia sin redirección (requiere JavaScript)
        # Esta opción sería más compleja y requeriría manipulación del DOM con JavaScript.
      end
  
    # Asegúrate de tener un método helper 'current_cart' definido
    private
  
    def current_cart
        # Intenta recuperar el carrito de la sesión, o crea uno nuevo si no existe
        if session[:cart_id]
          @current_cart ||= Cart.find_by(id: session[:cart_id])
          return @current_cart if @current_cart
        end
      
        # Si no se encuentra el carrito o no existe un ID en la sesión, crea uno nuevo
        @current_cart = Cart.create(user: current_user)  # Asegúrate de asignar un usuario si es necesario
        session[:cart_id] = @current_cart.id
        @current_cart
    end
  end
  