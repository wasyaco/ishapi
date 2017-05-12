
Ishapi::Engine.routes.draw do

  root :to => 'api#home'

  get 'cities',                :to => 'cities#index'
  get 'cities/view/:cityname', :to => 'cities#show'

  get 'reports',                   :to => 'reports#index'
  get 'reports/view/:report_name', :to => 'reports#show'

end
