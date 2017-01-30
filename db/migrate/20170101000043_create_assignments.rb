class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.string :name, null:false
      t.string :name_ruby
      t.string :name_en
      t.text :description
      t.timestamps
    end
    add_index :assignments, :name, unique:true
    %i(name_ruby name_en description).each do |column|
      add_index :assignments, column
    end
  end
end
