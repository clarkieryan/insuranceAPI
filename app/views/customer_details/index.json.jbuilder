json.array!(@customer_details) do |customer_detail|
  json.extract! customer_detail, :customerID, :dob, :telNumber, :street, :city, :county, :postCode, :licenceType, :licenceHeldSince, :occupation, :quotesStored, :incidents
  json.url customer_detail_url(customer_detail, format: :json)
end
