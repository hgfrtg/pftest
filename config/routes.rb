Rails.application.routes.draw do
  devise_for :users
  root 'musics#index'
  get '/search', to: 'search#search'
  resources :musics do
  	resource :music_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  resources :relationships, only: [:index, :create, :destroy]
  resources :users, only:[:index, :show, :update, :edit] do
  	member do
  	get :followings, :followers
  	end
  end
end
