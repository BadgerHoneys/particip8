json.array!(@evaluation_templates) do |evaluation_template|
  json.extract! evaluation_template, :id, :name, :school_class_id, :rating_type_id, :evaluation_type_id
  json.url evaluation_template_url(evaluation_template, format: :json)
end
