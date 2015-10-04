json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :name, :email, :school_id, :password
  json.url teacher_url(teacher, format: :json)
end
