#
# ishapi / maps / show
#

this_key = [ @map, params.permit! ]
json.cache! this_key do
  json.map do
    json.id @map.id.to_s
    json.slug @map.slug
    json.description @map.description
    json.w @map.w
    json.h @map.h
    json.img_path @map.img_path
    json.updated_at @map.updated_at

    json.markers []
  end
end


