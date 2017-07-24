
#
# ishapi / cities / show
#

key = [ @city, params.permit! ]
json.cache! key do
  json.city do
    json.id          @city.id.to_s
    json.name        @city.name
    json.cityname    @city.cityname
    json.description @city.description
    json.x           @city.x
    json.y           @city.y
    json.n_users     @city.current_users.count
    json.partial! 'ishapi/newsitems/index', :newsitems => @city.newsitems
    json.partial! 'ishapi/galleries/index', :galleries => @city.galleries
    json.partial! 'ishapi/reports/index',   :reports   => @city.reports
    json.partial! 'ishapi/users/index',     :users     => @city.current_users
    json.partial! 'ishapi/venues/index',    :venues    => @city.venues
    json.partial! 'ishapi/videos/index',    :videos    => @city.videos
  end
end
