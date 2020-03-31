#
# ishapi / galleries / _show
#
json.item_type    'gallery'
json.name         gallery.name
json.galleryname  gallery.galleryname
json.username     gallery.username || 'piousbox'
json.n_photos     gallery.photos.length
json.slug         gallery.galleryname
json.subhead      gallery.subhead
json.partial!    'ishapi/application/meta', :item => gallery
if gallery.is_premium
  json.premium_tier gallery.premium_tier
  json.is_premium   gallery.premium_tier > 0
  json.is_purchased current_user.profile.has_premium_purchase( gallery )
  json.partial!    'ishapi/photos/index',     :photos => [ gallery.photos[0] ]
else
  json.partial!    'ishapi/photos/index',     :photos => gallery.photos
end