Rails.application.routes.draw do
  mount Ishapi::Engine => "/ishapi"
  root :to => 'application#home'
end
