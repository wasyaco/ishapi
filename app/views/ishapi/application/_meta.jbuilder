
#
# ishapi / application / _meta
#

if item.city
  json.city do
    json.name item.city.name
  end
  json.cityname item.city.cityname
end
if defined?(item.tag) && !item.tag.blank?
  json.partial! 'ishapi/tags/index', tags: [ item.tag ]
end
if defined?(item.tags) && !item.tags.blank?
  json.partial! 'ishapi/tags/index', tags: item.tags
end
