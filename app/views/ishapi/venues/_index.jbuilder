
#
# ishapi / venues / _index
#

json.venues do
  json.array! venues do |venue|
    json.id          venue.id.to_s
    json.name        venue.name
    json.description venue.descr
    json.x           venue.x
    json.y           venue.y
  end
end
