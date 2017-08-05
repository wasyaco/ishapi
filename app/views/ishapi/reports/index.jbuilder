
#
# ishapi / reports / index.jbuilder
#

json.array! @reports do |report|
  json.id         report.id.to_s
  json.name       report.name
  json.reportname report.name_seo
  json.subhead    report.subhead
  if report.photo
    json.photo      report.photo.photo.url( :thumb )
  end
end

