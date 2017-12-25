
json.events events do |event|
  json.name        event.name
  json.eventname   event.eventname
  json.date        event.date
  json.description event.description
end
