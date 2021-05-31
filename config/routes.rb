Rails.application.routes.draw do
  root to: 'items#index'
  resources :markets, only: [:index]
end
