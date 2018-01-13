
# ishapi / orders / _show

json.n_items order.items.length
json.order do
  order.items.each do |item|
    json.partial! 'ishapi/orders/item', :item => item
  end
end
