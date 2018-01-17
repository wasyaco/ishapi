
# ishapi / orders / _show

json.n_items order.items.length
json.order do
  json.array! order.items do |item|
    json.partial! 'ishapi/orders/item', :item => item
  end
end
