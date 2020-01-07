Rails.application.routes.draw do
  root 'musics#index'
  resources :musics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
