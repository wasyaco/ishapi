
json.reports do
  json.array! @reports do |report|
    json.id   report.id.to_s
    json.name report.name
  end
end
