Rails.application.routes.draw do

  resources :posts
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # verb 'uri', to: 'controller#action', as: 'name'
  # can refer to as name_path

  get '/', to: 'users#home', as: 'home'

  get 'users', to: 'users#index', as: 'users'

  get 'users/:id', to: 'users#show', as: 'user'

  get 'users/login', to: 'users#login', as: 'login_page'

  post 'users/login', to: 'users#login', as: 'login'

  get 'users/forgot', to: 'users#forgot', as: 'forgot_page'

  post 'users/forgot', to: 'users#forgot', as: 'forgot'

  get 'users/create', to: 'users#create', as: 'create_page'

  post 'users/create', to: 'users/registrations#create', as: 'create'

  get 'admin', to: 'users#admin_index', as: 'users_admin'

  resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
