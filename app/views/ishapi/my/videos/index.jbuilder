
json.videos(@videos) do |video|
  json.name      video.name
  json.video_url     video.video
  json.thumb_url     video.thumb
end

