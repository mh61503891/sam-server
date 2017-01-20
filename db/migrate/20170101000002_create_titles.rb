class CreateTitles < ActiveRecord::Migration[5.0]
  def change
    create_table :titles do |t|
      t.string :name
      t.string :name_ruby
      t.string :name_en
      t.timestamps
    end
    %i(name name_ruby name_en).each do |column|
      add_index :titles, column
    end
  end
end
