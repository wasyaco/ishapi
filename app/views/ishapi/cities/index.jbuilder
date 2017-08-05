
#
# ishapi / cities / index
#

key = [ ::IshModels::CacheKey.one.cities ]
json.cache! key do
  json.array! @cities do |city|
    json.id city.id.to_s
    json.name city.name
    json.cityname city.cityname
    if city.profile_photo
      json.photo city.profile_photo.photo.url( :thumb )
    end
  end
end
