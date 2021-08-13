Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :wizards do
    resources :orders, only: [ :new, :create ]
    get "my_wizards", on: :collection
  end
  resources :wizards, only: [ :destroy ]
  resources :orders, only: [ :show ] do
    get "my_orders", on: :collection

  end
end
