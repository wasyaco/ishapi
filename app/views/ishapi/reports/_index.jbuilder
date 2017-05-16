
#
# ishapi / reports / _index
#

json.reports do
  json.array! reports do |report|
    json.id          report.id.to_s
    json.name        report.name
    json.reportname  report.name_seo
    json.description report.descr
  end
end
