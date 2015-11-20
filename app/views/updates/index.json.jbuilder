json.array!(@updates) do |update|
  json.extract! update, :id, :date, :mileage, :comment, :vehicle_id
  json.url update_url(update, format: :json)
end
