class CreateYpGaroonOrganizationUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :yp_garoon_organization_users, id:false do |t|
      t.references :organization, null:false, foreign_key:true
      t.references :user, null:false, foreign_key:true
      t.timestamps
    end
    add_index :yp_garoon_organization_users, [:organization_id, :user_id], unique:true, name:'index_yp_garoon_organizations_users_on_keys'
  end
end
