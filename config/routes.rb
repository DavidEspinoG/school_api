Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #login
  post '/login/student', to: 'login#student'
  post '/login/admin', to: 'login#admin'
  
  resources :students do 
    resources :courses
    resources :grades
  end

  get 'students/:student_id/courses/:course_id/grades', to: 'grades#grades_of_course'
end

