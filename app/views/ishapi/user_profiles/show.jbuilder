
json.name     @profile.name
json.username @profile.username

json.n_reports   @profile.reports.count
json.n_galleries @profile.galleries.count
json.n_videos    @profile.videos.count
json.n_stars     @profile.n_stars

if @profile.current_city
  json.current_city @profile.current_city
end

