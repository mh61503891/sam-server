class CreateYpGaroonMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :yp_garoon_memberships, id:false do |t|
      t.references :yp_garoon_person, null:false, foreign_key:true
      t.references :yp_garoon_group, null:false, foreign_key:true
      t.timestamps
    end
    add_index :yp_garoon_memberships, [:yp_garoon_person_id, :yp_garoon_group_id], unique:true, name:'index_yp_garoon_memberships_on_habtm'
  end
end
