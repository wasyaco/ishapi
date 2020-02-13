#
# ishapi / galleries / show_premium_unlocked
#

this_key = [ @gallery, params.permit! ]
json.cache! this_key do
  json.gallery do
    json.message      "Thanks for purchasing!"
    json.premium_tier @gallery.premium_tier
    json.is_premium   @gallery.is_premium
    json.is_purchased true

    json.partial! 'ishapi/galleries/show', gallery: @gallery   
    json.partial! 'ishapi/photos/index', :photos => @gallery.photos
  end
end

