json.total(@count)
json.name :licenses
json.rows @licenses do |license|
  json.extract! license, :id, :name, :name_ruby, :name_en, :description, :created_at, :updated_at
  json.url license_url(license)
end
