Rails.application.routes.draw do

  devise_for :users
  root to: 'ideas#index'

  resources :ideas

  get 'likes/dislike', to: 'likes#dislike', as: :dislike
  resources :likes

  namespace 'api' do
    namespace 'v1' do
      get 'ideas' => 'ideas#index', defaults: { format: 'json'}
    end
  end
end
