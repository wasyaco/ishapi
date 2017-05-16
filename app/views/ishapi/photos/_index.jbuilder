
#
# ishapi / photos / _index
#

json.photos do
  json.array! photos do |photo|
    json.partial! 'ishapi/photos/show', :photo => photo
  end
end          
