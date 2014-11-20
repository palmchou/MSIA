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
    get '3', to: 'news#news3', as: 'news_3'
    get '4', to: 'news#news4', as: 'news_4'
    get '5', to: 'news#news5', as: 'news_5'
    get '6', to: 'news#news6', as: 'news_6'
    get '7', to: 'news#news7', as: 'news_7'
  end
  resources :news

  # Routes for recommend software products
  # resources :recommendations

  # Routes for member services
  get 'members/login', to: 'members#login', as: 'members_login'
  get 'members/forum', to: 'members#forum', as: 'members_forum'
  resources :members


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
