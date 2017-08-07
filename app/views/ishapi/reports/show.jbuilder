
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

    # @TODO: move this to meta
    json.cityname @report.city.cityname if @report.city
    json.username @report.username
    json.tagname  @report.tag.name_seo  if @report.tag

  end
end
