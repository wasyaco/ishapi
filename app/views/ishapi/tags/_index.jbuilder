
##
## ishapi / tags / _index
##

json.tags do
  json.array! tags do |tag|
    json.name tag.name
    json.slug tag.name_seo
  end
end


