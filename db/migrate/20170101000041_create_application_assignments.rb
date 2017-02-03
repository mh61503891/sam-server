class CreateApplicationAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :application_assignments do |t|
      t.string :name, null:false
      t.string :name_ruby
      t.string :name_en
      t.text :description
      t.string :color
      t.integer :order
      t.timestamps
    end
    add_index :application_assignments, :name, unique:true
    %i(name_ruby name_en description color order).each do |column|
      add_index :application_assignments, column
    end
  end
end
