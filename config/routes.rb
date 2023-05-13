Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/login/student', to: 'login#student'
  post '/login/admin', to: 'login#admin'
  get '/student/:id/courses', to: 'students#courses'
  get '/student/:id/grades', to: 'students#grades'
  resources :students
  resources :courses
  resources :grades
end
