class Yp::Garoon::Group < ApplicationRecord

  has_many :memberships
  has_many :people, through: :memberships

  has_ancestry

  include SearchCop
  search_scope :search do
    attributes :id, :name, :description, :order, :version, :created_at, :updated_at
    attributes people: %w(id login_name name reading title email phone url description order version created_at updated_at).map{ |n| "people.#{n}" }
  end

end
