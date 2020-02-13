
#
# ishapi / galleries / _show
#

json.id           gallery.id.to_s
json.name         gallery.name
json.premium_tier gallery.premium_tier
json.galleryname  gallery.galleryname

json.partial! 'ishapi/photos/index', :photos => gallery.photos
