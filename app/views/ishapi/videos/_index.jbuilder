
#
# ishapi / videos / _index
#

json.n_videos videos.count
json.videos do
  json.array! videos do |video|
    json.partial! 'ishapi/videos/show', :video => video
  end
end
