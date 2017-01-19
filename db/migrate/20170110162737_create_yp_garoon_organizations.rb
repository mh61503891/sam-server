# https://cybozudev.zendesk.com/hc/ja/articles/202463620#step15
class CreateYpGaroonOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :yp_garoon_organizations do |t|
      t.string :name
      t.text :description
      t.integer :order
      t.string :version
      t.string :ancestry
      t.timestamps
    end
    add_index :yp_garoon_organizations, :ancestry
    %i(name description order version).each do |column|
      add_index :yp_garoon_organizations, column
    end
  end
end
