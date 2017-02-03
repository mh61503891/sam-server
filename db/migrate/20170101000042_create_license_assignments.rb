class CreateLicenseAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :license_assignments do |t|
      t.string :name, null:false
      t.string :name_ruby
      t.string :name_en
      t.text :description
      t.string :color
      t.integer :order
      t.timestamps
    end
    add_index :license_assignments, :name, unique:true
    %i(name_ruby name_en description color order).each do |column|
      add_index :license_assignments, column
    end
  end
end
