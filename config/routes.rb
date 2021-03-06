Rails.application.routes.draw do
  
  root to: 'pages#index' # homepage
  get '/about', to: 'pages#about'  #pages about page
  get '/contact-us', to: 'pages#contact'  # contact us page
 
  resources :courses, only: [:new, :show, :index] # courses routes
  
  # here we nested get :email_confirm route into students becuase this action heppen when we create a new student. So email_confirm is now a memeber of student resources
  resources :students, except: [:destroy] do  # students routes
    member do
      get :email_confirm
    end
  end
    

  # sessions routes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # student enroll on a course
  post 'course_enroll', to: 'student_courses#create'

  # email confirmation routes
  resources :confirmations, only: [:create, :edit, :new], param: :confirmation_token
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
