json.array!(@school_classes) do |school_class|
  json.extract! school_class, :id, :school_id, :user_id, :name, :start_time, :end_time
  json.url school_class_url(school_class, format: :json)
end
