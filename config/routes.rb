Ishapi::Engine.routes.draw do
  root :to => 'api#home'
  post 'home', :to => 'api#home'

  resources :addresses

  get 'cities',                :to => 'cities#index'
  get 'cities/view/:cityname', :to => 'cities#show'
  get 'cities/features',       :to => 'cities#features'
 
  post 'co_tailors/orders',                 :to => 'orders#create'
  post 'co_tailors/order_items',            :to => 'order_items#create'
  post 'co_tailors/measurements',           :to => 'measurements#update'
  get  'co_tailors/products/by-kind/:kind', :to => 'products#show'
  namespace :co_tailors do
  end

  get 'events/view/:eventname',      :to => 'events#show'

  get  'galleries',                   :to => 'galleries#index'
  post 'galleries',                   :to => 'galleries#index'
  get  'galleries/view/:galleryname', :to => 'galleries#show'
  post 'galleries/view/:galleryname', :to => 'galleries#show'

  post 'invoices/search', :to => 'invoices#search'

  get 'my/newsitems', to: 'newsitems#index'
  get 'my/account',   to: 'user_profiles#my'
  namespace :my do
    post 'reports', :to => 'reports#index'
    get  'reports', :to => 'reports#index'

    # resources :reports
    # resources :galleries
    # resources :videos
  end
  
  post 'payments', :to => 'payments#create'

  get 'profiles/view/:username', :to => 'user_profiles#show'

  get 'reports', :to => 'reports#index'
  get 'reports/view/:name_seo', :to => 'reports#show'

  get 'sites/view/:domain',                            :to => 'sites#show',      :constraints => { :domain => /[^\/]+/ }
  post 'sites/view/:domain',                           :to => 'sites#show',      :constraints => { :domain => /[^\/]+/ }
  get 'sites/view/:domain/newsitems/:newsitems_page',  :to => 'newsitems#index', :constraints => { :domain => /[^\/]+/ }
  get 'sites/view/:domain/reports',                    :to => 'reports#index',   :constraints => { :domain => /[^\/]+/ }
  get 'sites/view/:domain/reports/page/:reports_page', :to => 'reports#index',   :constraints => { :domain => /[^\/]+/ }
  get 'sites/view/:domain/tags',                       :to => 'tags#index',      :constraints => { :domain => /[^\/]+/ }

  post 'stars/buy', to: 'gameui#buy_stars'

  get 'tags/view/:tagname', :to => 'tags#show'
  get 'test', to: 'application#test'
  
  namespace :tgm do
  end

  post  'users/fb_sign_in',     :to => 'users#fb_sign_in'
  post  'users/profile',        :to => 'users#show'
  post  'users/profile/update', :to => 'users#update'
  get   'users/profile',        :to => 'users#show' # @TODO: only for testing! accessToken must be hidden
  match 'users/long_term_token', to: 'application#long_term_token', via: [ :get, :post ]

  get 'venues', :to => 'venues#index'
  get 'venues/view/:venuename', :to => 'venues#show'
 
  resources :videos

end
