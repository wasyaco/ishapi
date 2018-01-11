Ishapi::Engine.routes.draw do
  root :to => 'api#home'
  post 'home', :to => 'api#home'

  resources :addresses

  get 'cities',                :to => 'cities#index'
  get 'cities/view/:cityname', :to => 'cities#show'

  namespace :co_tailors do
  end

  get 'events/view/:eventname',      :to => 'events#show'

  get 'galleries',                   :to => 'galleries#index'
  get 'galleries/view/:galleryname', :to => 'galleries#show'

  post 'invoices/search', :to => 'invoices#search'

  namespace :my do
    post 'reports', :to => 'reports#index'
    get  'reports', :to => 'reports#index'

    # resources :reports
    # resources :galleries
    # resources :videos
  end

  post 'payments', :to => 'payments#create'

  get 'reports', :to => 'reports#index'
  get 'reports/view/:name_seo', :to => 'reports#show'

  get 'sites/view/:domain',                            :to => 'sites#show',      :constraints => { :domain => /[^\/]+/ }
  get 'sites/view/:domain/newsitems/:newsitems_page',  :to => 'newsitems#index', :constraints => { :domain => /[^\/]+/ }
  get 'sites/view/:domain/reports',                    :to => 'reports#index',   :constraints => { :domain => /[^\/]+/ }
  get 'sites/view/:domain/reports/page/:reports_page', :to => 'reports#index',   :constraints => { :domain => /[^\/]+/ }
  get 'sites/view/:domain/tags',                       :to => 'tags#index',      :constraints => { :domain => /[^\/]+/ }

  get 'tags/view/:tagname', :to => 'tags#show'

  namespace :tgm do
  end

  post 'users/fb_sign_in',     :to => 'users#fb_sign_in'
  post 'users/profile',        :to => 'users#show'
  post 'users/profile/update', :to => 'users#update'
  get  'users/profile',        :to => 'users#show' # @TODO: only for testing! accessToken must be hidden

  get 'venues', :to => 'venues#index'
  get 'venues/view/:venuename', :to => 'venues#show'
 
  resources :videos

end
