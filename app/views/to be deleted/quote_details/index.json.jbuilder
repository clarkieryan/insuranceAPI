json.array!(@quote_details) do |quote_detail|
  json.extract! quote_detail, 
  json.url quote_detail_url(quote_detail, format: :json)
end
