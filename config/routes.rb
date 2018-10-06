Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  resources :users, :only => [:index, :show]

  devise_scope :user do
    get '/users/:id', to: 'users#show'
  end


  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
end
