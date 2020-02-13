#
# ishapi / galleries / show_premium_locked
#

this_key = [ @gallery, params.permit! ]
json.cache! this_key do
  json.gallery do
    json.message "This is premium content - please purchase it to view!"
    json.partial! 'ishapi/galleries/show', gallery: @gallery   
    json.partial! 'ishapi/photos/index', :photos => [ @gallery.photos[0] ]
  end
end

