
json.name     @profile.name
json.username @profile.username
json.email    @profile.email

json.n_reports   @profile.reports.count
json.n_galleries @profile.galleries.count
json.n_videos    @profile.videos.count

if @profile.current_city
  json.current_city @profile.current_city
end

