Rails.application.routes.draw do

  devise_for :users
  root to: 'ideas#index'

  resources :ideas
  resources :options

  get 'likes/dislike', to: 'likes#dislike', as: :dislike
  resources :likes

  resources :comments, :only => [:create, :destroy]

end
