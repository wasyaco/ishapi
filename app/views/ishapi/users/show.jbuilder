
#
# ishapi / users / _show.jbuilder
#

json.email @user_profile.email

json.current_city do
  json.id   @user_profile.current_city_id.to_s
  json.name @user_profile.current_city.name
end
