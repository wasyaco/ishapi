#
# ishapi / newsitems / _index
#

json.n_newsitems newsitems.count
json.newsitems do
  json.array! newsitems do |item|

    json.id          item.id.to_s
    json.name        item.name
    json.created_at  item.created_at
    
    if item.gallery
      json.item_type  'gallery'
      json.name        item.gallery.name
      json.galleryname item.gallery.galleryname
     
      json.partial!    'ishapi/application/meta', :item => item.gallery
      json.partial!    'ishapi/photos/index',     :photos => item.gallery.photos
    end

    if item.report
      json.item_type  'report'
      json.name       item.report.name
      json.reportname item.report.name_seo
      json.subhead     item.report.subhead
      json.report_id  item.report_id.to_s
      json.username   item.report.user_profile.name if item.report.user_profile
      if item.report.photo
        json.photo_url item.report.photo.photo.url( :small ) 
        json.thumb_url item.report.photo.photo.url( :thumb )
      end
    end
    
    if item.video_id
      json.partial! 'ishapi/videos/show', :video => Video.unscoped.find( item.video_id )
      
      # json.item_type  'video'
      # json.name       item.video.name
      # json.descr      item.video.descr
      # json.x          item.video.x
      # json.y          item.video.y
      # json.youtube_id item.video.youtube_id
      # json.url        item.video.video.url
    end

    if item.photo
      json.item_type 'photo'
      json.partial! 'ishapi/photos/index', :photos => [ item.photo ]
    end
    
  end
end
