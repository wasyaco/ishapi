
#
# ishapi / reports / _index
#

json.n_reports reports.count
json.reports do
  json.array! reports do |report|
    json.id          report.id.to_s
    json.created_at  report.created_at
    json.name        report.name
    json.reportname  report.name_seo
    json.description report.descr
  end
end
