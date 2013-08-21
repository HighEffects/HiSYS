Hisys::Application.routes.draw do

  resources :task_lists

  resources :projects

  get 'admin', to: 'admin#index'
  get 'admin/slides', to: 'admin#slides'
  get 'admin/support_messages', to: 'admin#support_messages'
  get 'admin/user_list', to: 'admin#user_list'
  get 'admin/page_list', to: 'admin#page_list'
  get 'admin/post_list', to: 'admin#post_list'
  get 'admin/upload_list', to: 'admin#upload_list'
  get 'admin/comment_list', to: 'admin#comment_list'

  get 'contato', to: 'support_messages#index'
  get 'support_messages', to: 'support_messages#list'
  resources :support_messages

  get 'slides/list', to: 'slides#list'
  resources :slides do
      collection { post :sort }
  end

  get 'files/list', to: 'uploads#list'
  resources :uploads, :path => "files" do
    resources :comments
  end

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, :controllers => { :sessions => :sessions, :registrations => "registrations" }
  
  get "tags/index"
  get 'tags/*id', to: 'tags#show'
  get 'tags/', to: 'tags#index'
   
  get 'blog/list', to: 'posts#list'
  resources :posts, :path => "blog" do
    resources :comments
  end
  get 'blog/*id/edit', to: 'posts#edit'
  get 'blog/*id', to: 'posts#show'
  get 'blog/new', to: 'posts#new'
  
  
  get 'lab/list', to: 'pages#list' 
  resources :pages, :path => "lab" do
    resources :comments 
  end
  get 'lab/*id/edit', to: 'pages#edit'  
  get 'lab/*id', to: 'pages#show'
  get 'lab/new', to: 'pages#new'
 
  root :to => 'slides#index'
  
  match '*not_found', to: 'errors#error_404'
  
  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #    match 'pages/new' => 'pages#new'
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

 
  
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
