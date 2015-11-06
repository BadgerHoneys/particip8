json.array!(@current_days) do |current_day|
  json.extract! current_day, :id, :day, :school_class_id
  json.url current_day_url(current_day, format: :json)
end
