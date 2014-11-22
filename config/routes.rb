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
  # resources :recommendations

  devise_for :users

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

end
