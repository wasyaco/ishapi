
#
# ishapi / users / _show.jbuilder
#

json.email @user_profile.email
json.about @user_profile.about
json.lang  @user_profile.lang

if @user_profile.current_city
  json.current_city_id @user_profile.current_city_id.to_s
  json.current_city do
    json.id   @user_profile.current_city_id.to_s
    json.name @user_profile.current_city.name
  end
end
