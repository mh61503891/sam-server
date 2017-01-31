class CreatePersonLicenses < ActiveRecord::Migration[5.0]
  def change
    create_table :person_licenses do |t|
      t.references :person, null:false, foreign_key:true
      t.references :license, null:false, foreign_key:true
      t.references :assignment, null:false, foreign_key:true
      t.timestamps
    end
    add_index :person_licenses, [:person_id, :license_id, :assignment_id], unique:true, name:'index_person_licenses_on_habtm'
  end
end
