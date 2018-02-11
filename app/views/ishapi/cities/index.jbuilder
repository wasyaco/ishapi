
#
# ishapi / cities / index
#

key = [ ::IshModels::CacheKey.one.cities ]
json.cache! key do
  json.partial! 'index', :cities => @cities
end
