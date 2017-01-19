class Yp::Garoon::User < ApplicationRecord

  belongs_to :primary_organization, class_name:Yp::Garoon::Organization
  has_many :organization_users
  has_many :organizations, through: :organization_users
  enum status:{active:0, inactive:1, removed:2}

  include SearchCop
  search_scope :search do
    attributes :id, :login_name, :name, :reading, :title, :email, :phone, :url, :description, :primary_organization_id, :order, :status, :version, :created_at, :updated_at
    attributes organizations:%w(id name description version created_at updated_at).map{ |n| "organizations.#{n}"}
    attributes primary_organization:%w(id name description version created_at updated_at).map{ |n| "primary_organization.#{n}"}
  end

end
