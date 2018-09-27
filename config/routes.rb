Rails.application.routes.draw do



  # get 'friendships/accept', as: 'accept_friend_request'
  devise_for :users, controllers: { registrations: 'users/registrations'  }, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  get 'static_pages/home', as: 'home'
  authenticate :user do
    resources :likes, only: [:create, :destroy]
    resources :friendships, only: [:create, :update, :destroy]
    resources :users
    resources :posts, except: [:show]
    resources :comments, only: [:create, :destroy]
  end
  resources :posts, only: [:show]
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
