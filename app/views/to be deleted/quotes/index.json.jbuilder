json.array!(@quotes) do |quote|
  json.extract! quote, :customer_id, :incident_id, :vehicleReg, :estimatedMileage, :estimatedVehicleValue, :parkingLocation, :policyExcess, :breakdownCover, :windscreenCover
  json.url quote_url(quote, format: :json)
end
