
#
# ishapi / newsitems / _index
#

json.newsitems do
  json.array! newsitems do |item|
    if item.gallery
      json.item_type  'gallery' #@TODO: should be a constant
      json.name        item.gallery.name
      json.galleryname item.gallery.galleryname
      json.partial!   'ishapi/photos/index', :photos => item.gallery.photos
    end
    json.descr item.descr
  end
end
