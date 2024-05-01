# Creando un usuario
user = User.create!(
  username: 'Lukas Wolff Casanova',
  email: 'lwolff@miuandes.cl',
  password: 'Lukas2002'  # Asegúrate de tener 'has_secure_password' en tu modelo de User
)

# Creando direcciones para el usuario
addresses = Address.create!([
  {
    user: user,
    street: 'Calle Uno',
    city: 'Santiago',
    state: 'RM',
    zip_code: '1230000',
    description: 'Chile'
  },
  {
    user: user,
    street: 'Calle Dos',
    city: 'Viña del Mar',
    state: 'Valparaíso',
    zip_code: '2340000',
    description: 'Chile'
  }
])

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