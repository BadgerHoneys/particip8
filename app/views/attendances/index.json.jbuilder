json.array!(@attendances) do |attendance|
  json.extract! attendance, :id, :current_day_id, :user_id, :is_there
  json.url attendance_url(attendance, format: :json)
end
