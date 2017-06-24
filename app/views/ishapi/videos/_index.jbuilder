
#
# ishapi / videos / _index
#

json.videos videos do |video|
  json.youtube_id  video.youtube_id
  json.name        video.name
  json.description video.descr
  json.x           video.x
  json.y           video.y
end
