
#
# ishapi / galleries / _index
#

json.galleries do
  json.array! galleries do |gallery|
    json.partial! 'ishapi/galleries/show', :gallery => gallery
  end
end
