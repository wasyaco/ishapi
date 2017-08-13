 
#
# ishapi / sites / show
#

key = [ @site, params.permit! ]
json.cache! key do
  json.site do
    json.id        @site.id.to_s
    json.domain    @site.domain
    json.lang      @site.lang

    json.is_ads_enabled @site.is_ads_enabled

    json.partial! 'ishapi/features/index',  :features  => @site.features
    json.partial! 'ishapi/newsitems/index', :newsitems => @newsitems
    json.partial! 'ishapi/videos/index',    :videos    => @site.videos
  end
end
