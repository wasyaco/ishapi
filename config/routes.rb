
Ishapi::Engine.routes.draw do

  root :to => 'api#home'

  get 'cities',                :to => 'cities#index'
  get 'cities/view/:cityname', :to => 'cities#show'

  get 'galleries/view/:galleryname', :to => 'galleries#show'

  get 'reports/view/:name_seo', :to => 'reports#show'

  get 'sites/view/:domain', :to => 'sites#show', :constraints => { :domain => /[^\/]+/ }

  post 'users/fb_sign_in', :to => 'users#fb_sign_in'
  post 'users/profile',    :to => 'users#show'
  get  'users/profile',    :to => 'users#show' # @TODO: only for testing! accessToken must be hidden, therefore POST

  get 'venues/view/:venuename', :to => 'venues#show'

end
