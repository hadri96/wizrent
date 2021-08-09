Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :wizards do
    resources :orders, only: [ :show, :new, :create ]
  end
  resources :wizards, only: [ :destroy ]
end
