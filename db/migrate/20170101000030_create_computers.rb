class CreateComputers < ActiveRecord::Migration[5.0]
  def change
    create_table :computers do |t|
      t.string :name
      t.string :name_ruby
      t.string :name_en
      t.text :description
      t.integer :supplier_id, foreign_key:true
      t.integer :manufacturer_id, foreign_key:true
      t.timestamps
    end
    %i(name name_ruby name_en description supplier_id manufacturer_id).each do |column|
      add_index :computers, column
    end
  end
end
