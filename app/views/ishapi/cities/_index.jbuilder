
json.array! @cities do |city|
  json.id       city.id.to_s
  json.name     city.name
  # json.cityname city.cityname
  json.slug     city.cityname
  json.x        city.x
  json.y        city.y
  json.n_reports   city.reports.length
  json.n_galleries city.galleries.length
  json.n_videos    city.videos.length
  if city.profile_photo
    json.photo     city.profile_photo.photo.url( :thumb2 )
    json.thumb_img city.profile_photo.photo.url( :thumb2 )
  end
end
