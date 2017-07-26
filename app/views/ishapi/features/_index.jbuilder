
#
# ishapi / features / _index
#

json.n_features features.count
json.features do
  json.array! features do |feature|
    json.id   feature.id.to_s
    json.name feature.name
  end
end
