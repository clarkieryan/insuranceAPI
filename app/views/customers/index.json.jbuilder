json.array!(@customers) do |customer|
  json.extract! customer, :forename, :surname, :email
  json.url customer_url(customer, format: :json)
end
