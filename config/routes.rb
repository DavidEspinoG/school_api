Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/login/student', to: 'login#student'
  resources :students
  resources :courses
  resources :grades
end
