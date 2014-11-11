Rails.application.routes.draw do

  root 'home#index'

  # Routes for about
  scope '/about' do
    get 'info', to: 'about#info', as: 'about_info'
    get 'structure', to: 'about#structure', as: 'about_structure'
    get 'purpose', to: 'about#purpose', as: 'about_purpose'
  end
  # Routes for news
  scope '/news' do
    get 'notice', to: 'news#notice', as: 'news_notice'
    get 'msia', to: 'news#msia', as: 'news_msia'
    get 'industry', to: 'news#industry', as: 'news_industry'
  end
  resources :news

  # Routes for recommend software products
  resources :recommendations

  # Routes for member services
  resources :members
  get 'members/join-us', to: 'members#get_join', as: 'members_join'

  # Routes for talents service
  resources :talents

  # Routes for friendly links
  resources :links, only: :index

  # Routes for contact us page
  get 'contact', to: 'home#contact', as: 'contact_us'


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
