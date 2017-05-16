
#
# ishapi / galleries / show
#

this_key = [ @gallery, params.permit! ]
json.cache! this_key do
  json.gallery do
    json.id @gallery.id.to_s
    json.name @gallery.name
    json.galleryname @gallery.galleryname
    json.partial! 'ishapi/photos/index', :photos => @gallery.photos
  end
end

