class CreateComputerAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :computer_assignments do |t|
      t.string :key, null:false
      t.string :name, null:false
      t.string :name_ruby
      t.string :name_en
      t.text :description
      t.string :color
      t.integer :order
      t.timestamps
    end
    %i(key name).each do |column|
      add_index :computer_assignments, column, unique:true
    end
    %i(name_ruby name_en description color order).each do |column|
      add_index :computer_assignments, column
    end
  end
end
