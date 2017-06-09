
#
# ishapi / newsitems / _index
#

json.newsitems do
  json.array! newsitems do |item|
    if item.gallery
      json.item_type  'gallery' #@TODO: should be a constant
      json.name        item.gallery.name
      json.galleryname item.gallery.galleryname
      json.partial!   'ishapi/photos/index', :photos => item.gallery.photos
    end
    if item.report
      json.item_type  'report'
      json.name       item.report.name
      json.reportname item.report.name_seo
      json.report_id  item.report_id.to_s
    end
    json.descr item.descr
  end
end
