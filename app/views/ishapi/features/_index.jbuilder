
#
# ishapi / features / _index
#

json.features do
  json.array! features do |feature|
    json.id   feature.id.to_s
    json.name feature.name
  end
end
