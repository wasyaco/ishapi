#
# ishapi / galleries / show
#

this_key = [ @gallery, params.permit! ]
json.cache! this_key do
  json.gallery do
    json.partial! 'ishapi/galleries/show', gallery: @gallery   
    json.partial! 'ishapi/photos/index', :photos => @gallery.photos 

    json.partial! 'ishapi/application/meta', item: @gallery
  end
end

