json.total(@count)
json.rows @applications do |application|
  json.extract! application, :id, :name, :name_ruby, :name_en, :description, :created_at, :updated_at
  json.url application_url(application)
end
