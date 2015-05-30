Rails.application.routes.draw do
  # Block route for devise registration controller
  devise_for :users
  root 'pages#home'
  resources :user, :controller => "user"
  resources :courses
  resources :topics
  resources :instructors
  resources :categories
  resources :subscriptions, only: [:new, :create, :edit, :update]
  get 'mark_as_done' => 'topic_completition#mark_as_done'
  get 'course_information' => 'pages#course_information'
  get 'my_courses' => 'courses#my_courses'
end
