Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root to: 'home#index'
  
  get 'posts/index'
  get 'users/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # get '/users/sign_up', to: 'users#sign_up'
  # get '/users/sign_in', to: 'users#sign_in'
end
