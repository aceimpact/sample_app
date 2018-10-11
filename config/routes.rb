Rails.application.routes.draw do

  devise_for :users
  resources :users, :only => [:index, :show, :create, :update,:destroy]


  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  root 'static_pages#home'
end
