
#
# ishapi / galleries / _show
#

json.id          gallery.id.to_s
json.name        gallery.name
json.galleryname gallery.galleryname

json.partial! 'ishapi/photos/index', :photos => gallery.photos
