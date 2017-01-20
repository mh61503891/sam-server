# https://cybozudev.zendesk.com/hc/ja/articles/202463620#step4
class CreateYpGaroonPeople < ActiveRecord::Migration[5.0]
  def change
    create_table :yp_garoon_people do |t|
      t.string :login_name
      t.string :name
      t.string :reading
      t.string :title
      t.string :email
      t.string :phone
      t.string :url
      t.text :description
      t.integer :primary_organization_id
      t.integer :order
      t.integer :status, default:0, null:false
      t.string :version
      t.timestamps
    end
    add_index :yp_garoon_people, :login_name, unique:true
    %i(name reading title email phone url description primary_organization_id order status version).each do |column|
      add_index :yp_garoon_people, column
    end
  end
end
