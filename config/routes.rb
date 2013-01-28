DeviseAssignment::Application.routes.draw do


  devise_for :users , :controllers => { :sessions => "sessions"}
  devise_for :admins, :controllers => { :sessions => "admin/sessions"}

  resources :users do
    member do
      get :home
    end
  end
   #resources :orders do
  resources :products do
    resources :line_items do

    end

    end
  #end

  resources :line_items
  namespace :admin do
    resources :homes do
      collection do
        get :home
      end
    end

    resources :products do

    end
  end

  devise_scope :admin do
    get "admin", :to => "devise/sessions#new"
  end
  #resources :products do

  #end
  #match '/admin',  :to => 'admins#show'

  #devise_scope :user do
   # get "sign_in", :to => "devise/sessions#new"
  #end

  #constraints(:subdomain => ADMIN_SUBDOMAIN) do
   # scope :module => "admin" do
    #  resources :admins  do
        #collection  do
     #     get :show_admin_dashboard

        #end
      #end
     # root :to => 'admins#home'
    #end
  #end
  #devise_scope :user do
   # match "/" => "devise/registrations#new"
  #end
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
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  #root :to => 'devise/registrations#new'
  #root :to => 'devise/registrations#new'
  root :to => 'users#home'
end
