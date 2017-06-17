
Ishapi::Engine.routes.draw do

  root :to => 'api#home'

  get 'cities',                :to => 'cities#index'
  get 'cities/view/:cityname', :to => 'cities#show'

  get 'galleries/view/:galleryname', :to => 'galleries#show'

  get 'reports/view/:name_seo', :to => 'reports#show'

  get 'sites/view/:domain', :to => 'sites#show', :constraints => { :domain => /[^\/]+/ }

  get 'venues/view/:venuename', :to => 'venues#show'

end
