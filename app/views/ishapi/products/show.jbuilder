
params.permit!
json.cache! [ params, @product ] do
  json.cost        @product.cost
  json.title       @product.title
  json.description @product.description
  json.kind        @product.kind
end

