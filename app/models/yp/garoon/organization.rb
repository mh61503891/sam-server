class Yp::Garoon::Organization < ApplicationRecord

  has_many :organization_users
  has_many :users, through: :organization_users

  has_ancestry

  include SearchCop
  search_scope :search do
    attributes :id, :name, :description, :order, :version, :created_at, :updated_at
    attributes users: %w(id login_name name reading title email phone url description order version created_at updated_at).map{ |n| "users.#{n}" }
  end

end
