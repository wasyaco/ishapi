 
#
# ishapi / sites / show
#

key = [ @site, params.permit! ]
json.cache! key do
  json.site do
    json.id        @site.id.to_s
    json.domain    @site.domain
    json.lang      @site.lang
    json.newsitems do
      json.array! @newsitems do |item|
        json.descr item.descr
      end
    end
  end
end
