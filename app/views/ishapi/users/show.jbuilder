
#
# ishapi / users / _show.jbuilder
#

json.email                @user_profile.email
json.about                @user_profile.about
json.lang                 @user_profile.lang
json.name                 @user_profile.name
json.fb_long_access_token @long_lived_token

if @user_profile.current_city
  json.current_city_id @user_profile.current_city_id.to_s
  json.current_city    @user_profile.current_city
end
