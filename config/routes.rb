Rails.application.routes.draw do

  root 'static_pages#home'
  resources :users

  resources :jobs do 
    resources :applications, only: [:index, :new, :create]
  end

  resources :applications, only: [:show, :edit, :update, :destroy]

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
