Rails.application.routes.draw do
  devise_for :users
  
  get 'home/index', to: 'home#index'
  post '/home/index', to: 'posts#create'
  patch '/users/edit', to: 'users#update'

  resources :posts, only: [:show, :edit, :update, :destroy] do
    resources :likes
    resources :comments
  end
  
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
