class CreateYpGaroonMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :yp_garoon_memberships, id:false do |t|
      t.references :person, null:false, foreign_key:true
      t.references :group, null:false, foreign_key:true
      t.timestamps
    end
    add_index :yp_garoon_memberships, [:person_id, :group_id], unique:true
  end
end
