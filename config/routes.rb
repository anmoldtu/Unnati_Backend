Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'users/dashboard',to: 'users#dashboard'
  get 'users/:id/Assignment',to: 'users#Assignment'
  post 'users/result_create',to: 'users#result_create'
  get 'users/:uid/:mid/result_show',to: 'users#result_show'




  #Admin Routes

  get 'admins/sign_in',to: 'admins#sign_in'
  post 'admins/create_session',to: 'admins#create_session'
  delete 'admins/sign_out',to: 'admins#sign_out'
  get 'admins/index',to: 'admins#index'
  get 'admins/add_assignment',to: 'admins#add_assignment'
  post 'admins/question_create',to: 'admins#question_create'
  post 'admins/assignment_create',to: 'admins#assignment_create'
end
