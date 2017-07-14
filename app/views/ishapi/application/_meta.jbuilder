
#
# ishapi / application / _meta
#

if item.city
  json.city_name item.city.name
end
if item.tag
  json.tag_name item.tag.name
end
