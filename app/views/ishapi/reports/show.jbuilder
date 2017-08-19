
#
# ishapi / reports / show
#

key = [ @report, params.permit! ]
json.cache! key do
  json.report do
    json.id          @report.id.to_s
    json.name        @report.name
    json.reportname  @report.name_seo
    json.photo_url   @report.photo.photo.url( :small ) if @report.photo
    json.thumb_url   @report.photo.photo.url( :thumb )

    # @TODO: move this to meta
    json.created_at  @report.created_at.strftime('%Y%m%d')
    json.updated_at  @report.updated_at.strftime('%Y%m%d')
    json.username    @report.username
    json.cityname    @report.city.cityname if @report.city
    json.tagname     @report.tag.name_seo  if @report.tag

    json.subhead     @report.subhead
    json.description @report.descr

  end
end
