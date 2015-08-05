Rails.application.routes.draw do
  # Block route for devise registration controller
  devise_for :users
  root 'pages#home'
  resources :user, :controller => "user" do
    collection { post :import }
  end
  resources :courses
  resources :topics
  resources :instructors
  resources :categories
  resources :subscriptions, only: [:new, :create, :edit, :update]
  get 'mark_as_done' => 'topic_completition#mark_as_done'
  get 'course_information' => 'pages#course_information'
  get 'plans_information' => 'pages#plans_information'
  get 'politicas_servicio' => 'pages#politicas_servicio'
  get 'my_courses' => 'courses#my_courses'
  get 'welcome_new_user' => 'pages#welcome_video_user'
  get 'welcome_new_subscriptor' => 'pages#welcome_video_subscriptor'
  get 'discourse/sso' => 'discourse_sso#sso'
end
