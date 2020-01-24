Rails.application.routes.draw do
  devise_for :users
  root 'musics#index'
  get '/home/about', to: 'musics#about'
  get '/search', to: 'search#search'
  get 'chat/:id' => 'chat#show', as: 'chat'
  resources :musics do
  	resource :music_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
    post 'add' => 'clips#create'
    delete '/add' => 'clips#destroy'
  end
  resources :clips, only: [:index]
  resources :relationships, only: [:index, :create, :destroy]
  resources :users, only:[:index, :show, :update, :edit] do
  	member do
  	get :followings, :followers
  	end
  end
end
