
#
# ishapi / cities / show
#

key = [ @city, params.permit! ]
json.cache! key do
  json.city do
    json.id       @city.id.to_s
    json.name     @city.name
    json.cityname @city.cityname
  end
end
