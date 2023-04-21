Rails.application.routes.draw do

  resources :products
  
  devise_for :employees, controllers: {
    sessions: 'employees/sessions',
    registrations: 'employees/registrations'
  }

  resources :gcards do
    get 'redeem', to: 'gcards#redeem', as: :redeem
  end

  root 'pages#home'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  post "checkout/create", to: "checkout#create"

  post "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
  
  delete "products/remove_from_cart/:id", to: "products#remove_from_cart", as: "remove_from_cart"
  get "success", to: "checkout#success"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
end
