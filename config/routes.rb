Rails.application.routes.draw do
  devise_for :users
  
  get 'home/index', to: 'home#index'
  post '/home/index', to: 'posts#create'
  get 'posts/view/:id', to: 'posts#view'
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
