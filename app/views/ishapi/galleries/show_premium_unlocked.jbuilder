#
# ishapi / galleries / show_premium_unlocked
#

this_key = [ @gallery, params.permit! ]
json.cache! this_key do
  json.gallery do
    json.message "Thanks for purchasing!"
    json.partial! 'ishapi/galleries/show', gallery: @gallery   
    json.partial! 'ishapi/photos/index', :photos => [ @gallery.photos[0] ]
  end
end

