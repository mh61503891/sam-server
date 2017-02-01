json.total(@count)
json.name :computers
json.rows @computers do |computer|
  json.extract! computer, :id, :name, :name_ruby, :name_en, :description, :created_at, :updated_at
  json.url computer_url(computer)
end
