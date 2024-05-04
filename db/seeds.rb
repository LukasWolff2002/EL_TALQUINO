# Creando un usuario
user = User.create!(
  username: 'Lukas',
  email: 'lwolff@miuandes.cl',
  password: '12344478'  # Asegúrate de tener 'has_secure_password' en tu modelo de User
)



# Creando productos
products = Product.create!([
  {
    name: 'Laptop',
    description: 'High-performance laptop',
    price: 999.99
  },
  {
    name: 'Smartphone',
    description: 'Latest model smartphone',
    price: 599.99
  }
])