
# ishapi / tags / show

json.id      @tag.id.to_s
json.name    @tag.name
json.tagname @tag.tagname

json.partial! 'ishapi/newsitems/index', :newsitems => @tag.newsitems.page( params[:newsitems_page] ).per( 25 )

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
