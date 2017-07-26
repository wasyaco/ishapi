
#
# ishapi / newsitems / _index
#

json.n_newsitems newsitems.count
json.newsitems do
  json.array! newsitems do |item|
    if item.gallery
      json.item_type  'gallery' #@TODO: should be a constant
      json.name        item.gallery.name
      json.galleryname item.gallery.galleryname
     
      json.partial!    'ishapi/application/meta', :item => item.gallery
      json.partial!    'ishapi/photos/index',     :photos => item.gallery.photos.limit( 6 )
    end
    if item.report
      json.item_type  'report'
      json.name       item.report.name
      json.reportname item.report.name_seo
      json.report_id  item.report_id.to_s
    end
    if item.video
      json.partial! 'ishapi/videos/show', :video => item.video
    
      json.item_type  'video'
      json.name       item.video.name
      json.descr      item.video.descr
      json.x          item.video.x
      json.y          item.video.y
      json.youtube_id item.video.youtube_id
    end
    json.descr item.descr
  end
end
