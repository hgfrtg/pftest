Rails.application.routes.draw do
  devise_for :users
  root 'musics#index'
  resources :musics
  resources :users, only:[:index, :show, :update, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
