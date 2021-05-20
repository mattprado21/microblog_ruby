Rails.application.routes.draw do
  devise_for :users
  
  get 'home/index', to: 'home#index'
  post '/home/index', to: 'posts#create'
  # get 'posts/view/:id', to: 'posts#view'
  # get 'posts/edit/:id', to: 'posts#edit'
  
  resources :posts, only: [:index, :show, :edit, :update]
  
  get 'posts/edit/:id', to: 'posts#edit'
  patch 'posts/:id', to: 'posts#edit'
  delete 'posts/:id', to: 'posts#destroy'
  
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
