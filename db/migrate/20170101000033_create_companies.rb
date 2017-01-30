class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :name_ruby
      t.string :name_en
      t.text :description
      t.timestamps
    end
    %i(name name_ruby name_en description).each do |column|
      add_index :companies, column
    end
  end
end
