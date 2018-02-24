
#
# ishapi / venues / _index
#

json.n_venues venues.count
json.venues do
  json.array! venues do |venue|
    json.id          venue.id.to_s
    json.name        venue.name
    json.name_seo    venue.name_seo
    json.subhead     venue.subhead
    json.description venue.descr
    json.x           venue.x
    json.y           venue.y
    json.photo       venue.profile_photo.photo.url( :thumb ) if venue.profile_photo
    json.partial! 'ishapi/tags/index', :tags => venue.tags
  end
end
