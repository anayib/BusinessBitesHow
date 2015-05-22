Rails.application.routes.draw do
  # Block route for devise registration controller
  if Rails.env.production?
    devise_for :users, :controllers => { :registrations => "registrations" } 
  else
    devise_for :users
  end
  root 'pages#home'
  resources :user, :controller => "user"
  resources :courses
  resources :topics
  resources :instructors
  resources :categories
  get 'mark_as_done' => 'topic_completition#mark_as_done'
  get 'course_information' => 'pages#course_information'
  get 'my_courses' => 'courses#my_courses'
end
