
#
# ishapi / application / _meta
#

if item.city
  json.city do
    json.name item.city.name
  end
  json.cityname item.city.cityname
end
if item.tag
  json.tag_name item.tag.name
end
