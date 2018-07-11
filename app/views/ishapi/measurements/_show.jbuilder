
# _vp_ 20180309
# MEASUREMENT_PARAMS = [ :neck_around, :chest_around, :waist_around, :sleeve_length, :shoulder_width, :shirt_length, :bicep_around ]
#

json.measurement do
  json.neck_around     measurement.neck_around
  json.chest_around    measurement.chest_around
  json.waist_around    measurement.waist_around
  json.sleeve_length   measurement.sleeve_length
  json.shoulder_width  measurement.shoulder_width
  json.shirt_length    measurement.shirt_length
  json.bicep_around    measurement.bicep_around
end
