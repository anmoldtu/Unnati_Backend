Rails.application.routes.draw do

  #Home Route
  root 'home#index'

  #User Routes
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'user/root',to: 'users#dashboard'
  get 'users/dashboard',to: 'users#dashboard'
  get 'users/:id/Assignment',to: 'users#Assignment',as: :users_Assignment
  post 'users/result_create',to: 'users#result_create'
  get 'users/:uid/:mid/result_show',to: 'users#result_show',as: :users_result_show
  get 'users/:id/video',to: 'users#video',as: :users_video



  #Admin Routes

  get 'admins/sign_in',to: 'admins#sign_in'
  post 'admins/create_session',to: 'admins#create_session'
  delete 'admins/sign_out',to: 'admins#sign_out'
  get 'admins/index',to: 'admins#index'
  get 'admins/add_assignment',to: 'admins#add_assignment'
  post 'admins/question_create',to: 'admins#question_create'
  post 'admins/assignment_create',to: 'admins#assignment_create'


end
