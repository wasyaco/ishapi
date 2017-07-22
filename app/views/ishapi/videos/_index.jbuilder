
#
# ishapi / videos / _index
#

json.videos videos do |video|
  json.partial! 'ishapi/videos/show', :video => video
end
