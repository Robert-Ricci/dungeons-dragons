Rails.application.routes.draw do
  
  # get 'characters/index'
  # get 'characters/new'
  # get 'characters/create'
  # get 'characters/show'
  devise_for :users, :controllers => {:registrations => "registrations"}
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end
  
  # devise_scope :user do
  #   get 'logout', to: ' devise/registration#delete'
  # end

  resources :characters

  # resources :users do 
  #   resources :characters
  # end

  root to: 'pages#index'

end
