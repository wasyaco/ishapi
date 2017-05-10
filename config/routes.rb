
Ishapi::Engine.routes.draw do

  resources :articles
  root :to => 'api#home'

end
