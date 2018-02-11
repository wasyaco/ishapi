
#
# ishapi / cities / features
#

key = [ ::IshModels::CacheKey.one.feature_cities ]
json.cache! key do
  json.partial! 'index', :cities => @cities
end
