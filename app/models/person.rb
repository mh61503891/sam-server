class Person < ApplicationRecord
  devise :database_authenticatable, :rememberable, :trackable, :validatable
  include SearchCop
  search_scope :search do
    attributes :id, :email, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :uid, :yp_ldap_uid, :yp_garoon_uid, :name, :name_ruby, :name_en, :description, :created_at, :updated_at
  end
  has_many :person_computers
  has_many :computers, through: :person_computers
  has_many :person_applications
  has_many :applications, through: :person_applications
  has_many :person_licenses
  has_many :licenses, through: :person_licenses
  #  devise :database_authenticatable, :rememberable, :trackable, :validatable, authentication_keys:[:uid]
end
