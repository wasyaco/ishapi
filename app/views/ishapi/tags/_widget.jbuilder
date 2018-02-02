
#
# _vp_ 20180201
# ishapi / tags / _widget
#

json.id      tag.id.to_s
json.name    tag.name
json.tagname tag.tagname

json.partial! 'ishapi/newsitems/index', :newsitems => tag.newsitems.limit(1)

=begin
json.videos do
  json.array! @tag.videos
end
json.reports do
  json.array! @tag.reports
end
json.galleries do
  json.array! @tag.galleries
end
=end
