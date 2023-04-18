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
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
