
#
# ishapi / reports / show
#

key = [ @report, params.permit! ]
json.cache! key do
  json.report do
    json.id          @report.id.to_s
    json.name        @report.name
    json.reportname  @report.name_seo
    json.description @report.descr
  end
end
