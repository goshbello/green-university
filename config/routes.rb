Rails.application.routes.draw do
  
  root to: 'courses#index' # homepage
  
  get 'courses/new', to: 'courses#new'  #create new course
  get '/about', to: 'pages#about'  #pages about page

  resources :students, except: [:destroy]

  # sessions routes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
