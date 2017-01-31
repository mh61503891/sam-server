class Yp::Garoon::Person < ApplicationRecord

  belongs_to :primary_group, class_name:Yp::Garoon::Group
  has_many :memberships
  has_many :groups, through: :memberships
  enum status:{active:0, inactive:1, removed:2}

  include SearchCop
  search_scope :search do
    attributes :id, :login_name, :name, :reading, :title, :email, :phone, :url, :description, :primary_group_id, :order, :status, :version, :created_at, :updated_at
    attributes groups:%w(id name description version created_at updated_at).map{ |n| "groups.#{n}"}
    attributes primary_group:%w(id name description version created_at updated_at).map{ |n| "primary_group.#{n}"}
  end

end
