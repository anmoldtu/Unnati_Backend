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
  get 'users/add_bio', to: 'users#add_bio'
  post 'users/bio_create',to: 'users#bio_create'
  get 'users/acc_lock',to: 'users#acc_lock'
  get 'users/:id/profile',to: 'users#profile',as: :users_profile

  #Entres Routes
  devise_for :entres

  get 'entre/root',to: 'entres#dashboard'
  get 'entres/dashboard',to: 'entres#dashboard'
  get 'entres/add_entrebio', to: 'entres#add_entrebio'
  post 'entres/entrebio_create',to: 'entres#entrebio_create'
  post 'entres/:id/attend_create',to: 'entres#attend_create',as: :entres_attend_create
  post 'entres/:id/attend_destroy',to: 'entres#attend_destroy',as: :entres_attend_destroy
  get 'entres/add_money',to: 'entres#add_money'
  post 'entres/fees_deposit',to: 'entres#fees_deposit',as: :entres_fees_deposit

  #Admin Routes

  get 'admins/sign_in',to: 'admins#sign_in'
  post 'admins/create_session',to: 'admins#create_session'
  delete 'admins/sign_out',to: 'admins#sign_out'
  get 'admins/index',to: 'admins#index'
  get 'admins/add_assignment',to: 'admins#add_assignment'
  post 'admins/question_create',to: 'admins#question_create'
  post 'admins/assignment_create',to: 'admins#assignment_create'
  get 'admins/add_module',to: 'admins#add_module'
  post 'admins/module_create',to: 'admins#module_create'
  get 'admins/add_study_material',to: 'admins#add_study_material'
  post 'admins/:id/create_study_material',to: 'admins#create_study_material',as: :create_study_material

end
