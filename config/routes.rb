Rails.application.routes.draw do

  root 'static_pages#home'
  resources :users

  resources :jobs do 
    resources :job_applications, only: [:index, :show, :new, :create, :edit, :update]
  end

  resources :job_applications

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  

  

  get '/auth/facebook/callback' => 'sessions#create'
  
  get 'auth/failure' => redirect('/')

  get '/signout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
