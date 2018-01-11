
# ishapi / addresses / _show

json.address do
  json.name      address.name
  json.phone     address.phone
  json.address_1 address.address_1
  json.address_2 address.address_2
  json.city      address.city
  json.state     address.state
  json.zipcode   address.zipcode
end
