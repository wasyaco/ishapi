
json.id          video.id.to_s
json.youtube_id  video.youtube_id
json.name        video.name
json.description video.descr
json.x           video.x
json.y           video.y
json.url         video.video.url 
json.item_type   'video'

if video.city
  json.city_name video.city.name
end

if video.tag
  json.tag video.tag.name
end

if video.user_profile
  json.username video.user_profile.name
end
