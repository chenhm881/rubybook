Rails.application.routes.draw do
  get 'articles/index'

  get 'categories/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  match 'signup' => 'users#new', via: :get
  match 'signin' => 'sessions#new', via: :get
  match 'signout' => 'sessions#destroy', via: :delete
  match 'articlejson' => 'articles#json', via: :post
  match 'articletags' => 'articles#tags', via: :get
  get 'articles/note' => 'articles#note', via: :get
  get 'articles/new_content' => 'articles#new_content', :as => :new_content, via: :get
  match 'articles/save_content' => 'articles#save_content', :as => :save_content, via: :post
  match 'articles/answer(.:format)' => 'articles#answer', :as => :answer, via: :post
  match 'articles/search' => 'articles#search', :as => :search, via: :post
  resources :users
  resource :session
  resources :articles, only:[:new, :create, :edit, :update, :show, :destroy]
  resources :categories do
    resources :articles, only: [], shallow: true do
      member do
        get :correlateds, :correlations
      end
    end
  end
  resources :tags
  resources :notes, only:[:index, :new, :create, :edit, :update, :show, :destroy]
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
