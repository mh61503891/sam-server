# require 'active_record'
require 'json'

namespace :sunaba do
  namespace :garoon do
    desc 'Create Garoon'
    task :update => :environment do
      p AddressBook::Garoon::User.first
      p ENV

      # ActiveRecord::Base.establish_connection(
      #   :adapter => 'sqlite3',
      #   :database => 'db/garoon.sqlite3'
      # )

      # ActiveRecord::Migration.create_table :organizations do |t|
      #   t.string :key, null:false
      #   t.string :name
      #   t.integer :order
      #   t.string :version
      #   t.string :ancestry
      #   t.timestamps
      # end
      # ActiveRecord::Migration.add_index :organizations, :key, unique:true
      # ActiveRecord::Migration.add_index :organizations, :ancestry

      # ActiveRecord::Migration.create_table :users do |t|
      #   t.string :key, null:false
      #   t.string :name
      #   t.integer :order
      #   t.integer :status
      #   t.string :version
      #   t.text :content
      #   t.integer :primary_organization_id
      #   t.timestamps
      # end
      # ActiveRecord::Migration.add_index :users, :key, unique:true

      # ActiveRecord::Migration.create_table :user_organizations do |t|
      #   t.integer :user_key, foreign_key:true
      #   t.integer :organization_key, foreign_key:true
      #   t.timestamps
      # end
      # ActiveRecord::Migration.add_index :user_organizations, [:user_key, :organization_key], unique:true

      # module Garoon
      #   class Organization < ActiveRecord::Base
      #     has_ancestry
      #   end
      #   class User < ActiveRecord::Base
      #   end
      #   class UserOrganization < ActiveRecord::Base
      #   end
      # end

      # base_path = '/Users/masayuki/tmp-garoon'
      # orgs = JSON.parse(File.read(File.join(base_path, 'organizations.json')))
      # users = JSON.parse(File.read(File.join(base_path, 'users.json')))
      #
      # orgs['organization'].each do |org|
      #   o = Garoon::Organization.find_or_create_by(key:org['key'])
      #   o.update_attributes({
      #     key:org['key'],
      #     name:org['name'],
      #     order:org['order'].to_i,
      #     version:org['version']
      #   })
      #   if org['parent_organization']
      #     o.parent = Garoon::Organization.find_or_create_by(key:org['parent_organization'])
      #     o.save
      #   end
      #   org['organization']&.each do |child_org|
      #     co = Garoon::Organization.find_or_create_by(key:child_org['key'])
      #     co.parent = o
      #     co.save
      #   end
      #
      #   org['members'][0]['user']&.each do |user|
      #     u = Garoon::User.find_or_create_by(key:user['id'])
      #     Garoon::UserOrganization.find_or_create_by(user_key:u.key,organization_key:o.key)
      #   end
      # end
      #
      # users['user'].each do |user|
      #   u = Garoon::User.find_or_create_by(key:user['key'])
      #   u.update_attributes({
      #     key:user['key'],
      #     name:user['name'],
      #     order:user['order'].to_i,
      #     status:user['status'].to_i,
      #     version:user['version'],
      #     content:user['content'],
      #     primary_organization_id:user['primary_organization']
      #   })
      #   user['organization']&.each do |uo|
      #     Garoon::UserOrganization.find_or_create_by(user_key:u.key,organization_key:uo['id'])
      #   end
      # end
      #
      #
      # require 'pry'
      # binding.pry


    end
  end
end
