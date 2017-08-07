
#
# ishapi / features / _index
#

json.n_features features.count
json.features do
  json.array! features do |feature|
    if feature.report_id
      r = feature.report
      json.report_id  r.id.to_s
      json.name       r.name
      json.subhead    r.subhead
      json.reportname r.name_seo
      json.photo_url  r.photo.photo.url( :thumb )
    end
  end
end
