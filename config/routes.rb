Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root 'home#welcome'
  get 'home', to: 'home#index', as: :home

  get 'login', to: 'sessions#new', as: :login  # Define la ruta para mostrar el formulario de inicio de sesión
  post 'login', to: 'sessions#create'  # Define la ruta para procesar el formulario de inicio de sesión
  delete 'logout', to: 'sessions#destroy', as: :logout  # Opcional: Define la ruta para cerrar sesión

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  resources :users
end
