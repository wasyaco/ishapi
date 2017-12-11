
# ishapi / tags / show

json.id       @tag.id.to_s
json.name     @tag.name
json.name_seo @tag.name_seo

json.videos do
  json.array! @tag.videos
end

json.reports do
  json.array! @tag.reports
end

json.galleries do
  json.array! @tag.galleries
end
