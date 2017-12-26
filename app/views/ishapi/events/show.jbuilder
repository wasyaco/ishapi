
json.event do
  json.name @event.name
  json.date @event.date
  json.eventname @event.eventname
  json.description @event.description
  json.city do
    json.name @event.city.name
    json.cityname @event.city.cityname
  end
end
