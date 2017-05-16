 
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
        if item.gallery
          json.item_type 'gallery'
          json.name      item.gallery.name
          json.partial! 'ishapi/photos/index', :photos => item.gallery.photos
        end
        json.descr item.descr
      end
    end
  end
end
