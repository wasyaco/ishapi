
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
    json.partial! 'ishapi/newsitems/index', :newsitems => @city.newsitems
    json.partial! 'ishapi/galleries/index', :galleries => @city.galleries
    json.partial! 'ishapi/reports/index',   :reports   => @city.reports
  end
end
