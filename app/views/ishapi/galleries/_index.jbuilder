
#
# ishapi / galleries / _index
#

json.n_galleries galleries.count
json.galleries do
  json.array! galleries do |gallery|
    json.partial! 'ishapi/galleries/show', :gallery => gallery
  end
end
