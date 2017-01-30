class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :name_ruby
      t.string :name_en
      t.text :description
      t.string :ancestry
      t.timestamps
    end
    add_index :groups, :ancestry
    %i(name name_ruby name_en description).each do |column|
      add_index :groups, column
    end
  end
end
