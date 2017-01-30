class CreatePersonApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :person_applications do |t|
      t.references :person, null:false, foreign_key:true
      t.references :application, null:false, foreign_key:true
      t.references :assignment, null:false, foreign_key:true
      t.timestamps
    end
    add_index :person_applications, [:person_id, :application_id, :assignment_id], unique:true, name:'index_person_applications_on_habtm'
  end
end
