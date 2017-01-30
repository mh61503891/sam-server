class CreateMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :memberships, id:false do |t|
      t.references :person, foreign_key:true
      t.references :group, foreign_key:true
      t.references :title, foreign_key:true
      t.timestamps
    end
    add_index :memberships, [:person_id, :group_id, :title_id], unique:true
  end
end
