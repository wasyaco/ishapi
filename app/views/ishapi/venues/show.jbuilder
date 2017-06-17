
#
# ishapi / venues / show
#

key = [ @venue, params.permit! ]
json.cache! key do
  json.venue do
    json.name        @venue.name
    json.venuename   @venue.name_seo
    json.description @venue.descr
  end
end


