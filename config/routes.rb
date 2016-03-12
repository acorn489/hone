Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'access#login'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  post "access/attempt_login"
  get "access/logout"
  get "access/login"

  get "access" => "access#show"
  get "home" => "home#show"
  get "admin" => "admin#show"

  post "developers/attempt_login"
  get "courses/:slug" => "courses#show"
  get "domains/:slug" => "domains#show"
  get "domains/:slug/games" => "domains#game_store"

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  #resources :users
  resources :games
  resources :skills

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

  # All routes to communicate with the API methods
  namespace :api, defaults: { format: :json } do
    get 'students/test' => 'students#test'
    post 'students/login' => 'students#login'
    post 'students/submit_score' => 'students#submit_score'
    resources :students, only: :index do
      member do
      end
    end
  end
end
