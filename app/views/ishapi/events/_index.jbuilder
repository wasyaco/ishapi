
json.events events do |event|
  json.id          event.id.to_s
  json.name        event.name
  json.eventname   event.eventname
  json.date        event.date
  json.description event.description
  json.x           event.x
  json.y           event.y
  if event.profile_photo
    json.photo       event.profile_photo.photo.url(:thumb) 
  end
end
