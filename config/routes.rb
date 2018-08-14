Rails.application.routes.draw do
  resources :transactions
  devise_for :users
  resources :accounts
  get '/users/:id', to: 'users#show', as: 'user'
  root 'users#profile'
  resources :transactions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
