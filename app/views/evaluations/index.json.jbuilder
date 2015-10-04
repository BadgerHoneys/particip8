json.array!(@evaluations) do |evaluation|
  json.extract! evaluation, :id, :evaluation_template_id
  json.url evaluation_url(evaluation, format: :json)
end
