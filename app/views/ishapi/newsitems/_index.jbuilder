
#
# ishapi / newsitems / _index
#

json.n_newsitems newsitems.count
json.newsitems do
  json.array! newsitems do |item|
    json.created_at item.created_at
    json.descr item.descr
    json.name      item.name
    
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
      json.descr      item.report.subhead
      json.report_id  item.report_id.to_s
      json.username   item.report.user_profile.name
      if item.report.photo
        json.photo_url item.report.photo.photo.url( :small ) 
        json.thumb_url item.report.photo.photo.url( :thumb )
      end
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
    if item.photo
      json.item_type 'photo'
      json.partial! 'ishapi/photos/index', :photos => [ item.photo ]
    end
    
  end
end
