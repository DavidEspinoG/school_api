Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #login
  post '/login/student', to: 'login#student'
  post '/login/admin', to: 'login#admin'
  
  resources :students do 
    resources :courses, except: [:index]
    resources :grades
  end

  resources :courses, only: [:index, :destroy]
  resources :grades, only: [:destroy, :update]

  post '/createAdmin', to: 'login#create'
  get 'students/:student_id/courses/:course_id/grades', to: 'grades#grades_of_course'
  get 'students/:student_id/courses/', to: 'courses#courses_of_student'
  get 'students/course/:course_id', to: 'students#students_of_course'
end

