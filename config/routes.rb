Rails.application.routes.draw do
  root 'home#top'
  devise_for :users

  get '/home/about', to: 'home#about'



  resources :books
  resources :users, only: [:index,:show,:edit,:update]
end
