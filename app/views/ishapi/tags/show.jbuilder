
#
# _vp_ 20180204
# ishapi / tags / show
#

json.id      @tag.id.to_s
json.name    @tag.name
json.tagname @tag.tagname

json.partial! 'ishapi/newsitems/index', :newsitems => @tag.newsitems.page( params[:newsitems_page] ).per( 25 )
json.partial! 'ishapi/reports/index', :reports => @tag.reports.page( params[:reports_page] ).per(25)
json.partial! 'ishapi/galleries/index', :galleries => @tag.galleries.page( params[:galleries_page] ).per(25)
json.partial! 'ishapi/videos/index', :videos => @tag.videos.page( params[:videos_page] ).per(25)
