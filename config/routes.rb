Rails.application.routes.draw do
  root 'sessions#new'
  resources :users, except: :index
  resources :profiles do
  resources :lessons, only: [:create, :new]
  end

  post '/book/:lesson_id', to: 'lessons#book_lesson', as: 'book_lesson' #book_lesson_path(lesson_id: ...)
  delete '/delete/:lesson_id', to: 'lessons#delete_lesson', as: 'delete_lesson' #delete_lesson_path(lesson_id: ...)
  resources :lessons, except: [:create, :new]
  resources :reviews
  resources :sessions, only: [:create]
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  get "user_lessons/:id", to: "users#lessons"
end
