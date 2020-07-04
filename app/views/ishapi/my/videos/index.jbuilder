
json.videos(@videos) do |video|
  json.created_at video.created_at
  json.id         video.id.to_s
  json.name       video.name
  json.thumb_url  video.thumb
  json.video_url  video.video
end

