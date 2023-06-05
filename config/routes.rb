Rails.application.routes.draw do
  root 'application#index'
  get 'users/login', to: 'users#login'



  # TETING Process... ***************
  get 'home/show'
  get 'home/profile_page'

  # devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  # ***************

  # get 'users/login', to: 'projects#created'
 
  
  devise_for :users,
         path: 'devise'
        #path: 'project'


  devise_scope :user do
    get 'devise/sign_out', to: 'devise/sessions#destroy'
    get 'destroy_user/:id' => "users#destroy_user"
    get 'remove_from_admin/:id' => "users#remove_from_admin"
    get 'add_admin/:id' => "users#add_admin", as: 'add_admin_form'
    post 'add_admin/:id' => "users#add_admin", as: 'add_admin'
    # get 'sign_out', to: 'devise/sessions#destroy'
    get 'destroy_user/:id' => "users/sessions#destroy_user"
  

    # New ****************
    get 'user_admin', to: 'users/sessions#admin'
    delete 'destroy', to: 'users/sessions#destroy'
    get 'destroy_user/:id' => "users/sessions#destroy_user"
    get 'remove_from_admin/:id' => "users/sessions#remove_from_admin"
    get 'add_admin/:id' => "users/sessions#add_admin"

    get 'edit_user/:id' => "users#edit", as: 'edit_user_role'

      #******************


  end

  delete 'users/:id', to: 'users#destroy', as: 'delete_user'
  
  get 'users/add', to: 'users#adduser', as: 'add_user'
  post 'users/add', to: 'users#add_user', as: 'add_new_user'
  get 'projects/shared', to: 'projects#shared', as: 'shared_projects'
  get 'projects/created', to: 'projects#created', as: 'created_projects'
  post 'projects/new', to: 'projects#create', as: 'add_new_project'
  delete 'projects/:id', to: 'projects#destroy', as: 'destroy_project'
  get 'users', to: 'users#index', as: 'user_index'

  resources :projects
  resources :users
  
end
