Rails.application.routes.draw do
  
  root to: 'pages#index' # homepage
  get '/about', to: 'pages#about'  #pages about page
 
  resources :courses, only: [:new, :show, :index] # courses routes
  resources :students, except: [:destroy]         # students routes

  # sessions routes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # student enroll on a course
  post 'course_enroll', to: 'student_courses#create'
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
