Rails.application.routes.draw do
  resources :stonknotes, only: [:index]
  post 'stonknotes', to: 'stonknotes#index'

  root to: 'home#index'
end
