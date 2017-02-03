class CreatePersonComputers < ActiveRecord::Migration[5.0]
  def change
    create_table :person_computers do |t|
      t.references :person, null:false, foreign_key:true
      t.references :computer, null:false, foreign_key:true
      t.references :computer_assignment, null:false, foreign_key:true
      t.timestamps
    end
    add_index :person_computers, [:person_id, :computer_id, :computer_assignment_id], unique:true, name:'index_person_computers_on_habtm'
  end
end
