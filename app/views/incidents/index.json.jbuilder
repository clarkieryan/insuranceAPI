json.array!(@incidents) do |incident|
  json.extract! incident, :date, :value, :type, :desc
  json.url incident_url(incident, format: :json)
end
