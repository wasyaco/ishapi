
#
# ishapi / sites / show
#

key = [ @site, params.permit! ]
json.cache! key do
  json.site do
    json.id        @site.id.to_s
    json.domain    @site.domain
    json.lang      @site.lang
    json.newsitems @site.newsitems.limit(10)
  
    # json.reports @site.reports
  end
end
