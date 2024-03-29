Mytodolist::Application.routes.draw do

  resources :photos

  resources :galleries

  devise_for :users, :path_names => {:sign_up => "register"}



  #resources :tasks

 # root    :to => "lists#index"

  root :to => "lists#home"


  match "new" => "lists#new"
  match "create" => "lists#create"
  match "show/:id" => "lists#show"
  match "edit/:id" => "lists#edit"
  match "delete" => "lists#destroy"
  match "lists/index" => "lists#index"
  match "lists/show" => "lists#show"
  match "show/:id" =>"lists#show"




#  match "/tasks/new/:id" => "tasks#new"
 # match "/tasks/index" => "tasks#index"
 # match "search/:id" => "tasks#index"
#  match "list_all_tasks" => "tasks#list_all_tasks"
 # match "tasks" =>"lists#edit"


  #match "lists/:id/tasks" => "tasks#show"
  match "tasks/:id" => "tasks#index"


  match 'lists/:list_id/tasks/:id/complete' => 'tasks#complete', :as => 'complete_task'
  match 'lists/:list_id/tasks/:id/destroy'  => 'tasks#destroy' , :as => 'destroy_task'
  match 'lists/:list_id/tasks/:id/create' => 'tasks#create', :as => 'create_task'




  resources :lists  do
      resources :tasks
  end

  resources :galleries do
    resources :photos
  end


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index_copy.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
