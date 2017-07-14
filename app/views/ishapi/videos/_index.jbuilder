
#
# ishapi / videos / _index
#

json.videos videos do |video|
  json.partial! :show, :video => video
end
