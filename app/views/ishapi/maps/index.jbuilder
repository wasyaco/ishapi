#
# ishapi / maps / index
#

json.maps do
  @maps.each do |map|
    json.id map.id.to_s
    json.slug map.slug
  end
end


