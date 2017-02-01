json.total(@count)
json.name :people
json.rows @people do |person|
  json.extract! person, :id, :email, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :uid, :name, :name_ruby, :name_en, :description, :created_at, :updated_at
  json.url person_url(person)
  json.computers_count person.computers.count
  json.applications_count person.applications.count
  json.licenses_count person.licenses.count
end
