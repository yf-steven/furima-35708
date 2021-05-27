Rails.application.routes.draw do
  root to: 'markets#index'
  resources :markets, only: [:index]
end
