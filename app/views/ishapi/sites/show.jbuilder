 
#
# ishapi / sites / show
#

key = [ @site, params.permit! ]
json.cache! key do
  json.site do
    json.id        @site.id.to_s
    json.domain    @site.domain
    json.lang      @site.lang
    json.langs     @langs
    json.title     @site.title
    json.subhead   @site.subhead

    json.is_ads_enabled         @site.is_ads_enabled
    json.play_videos_in_preview @site.play_videos_in_preview
    json.newsitems_per_page     @site.newsitems_per_page

    json.partial! 'ishapi/features/index',  :features  => @site.features, :resource => @site
    json.partial! 'ishapi/galleries/index', :galleries => @galleries,     :resource => @site
    json.partial! 'ishapi/newsitems/index', :newsitems => @newsitems,     :resource => @site
    json.partial! 'ishapi/reports/index',   :reports   => @reports,       :resource => @site
    json.partial! 'ishapi/videos/index',    :videos    => @site.videos
    
  end
end
