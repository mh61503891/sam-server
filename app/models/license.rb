class License < ApplicationRecord
  include SearchCop
  search_scope :search do
    attributes :id, :name, :name_ruby, :name_en, :description, :created_at, :updated_at
  end
  has_many :person_licenses
  has_many :people, through: :person_licenses
end
