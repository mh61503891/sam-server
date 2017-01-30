class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      # Database authenticatable
      t.string :email  # NOTE An e-mail address is not unique identifier in this application's policy.
      t.string :encrypted_password
      # Rememberable
      t.datetime :remember_created_at
      # Trackable
      t.integer :sign_in_count, default:0, null:false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip
      # Timestamps
      t.timestamps null:false
      # UID
      t.string :uid, null:false
      # Options
      t.string :yp_ldap_uid
      t.string :yp_garoon_uid
      t.string :name
      t.string :name_ruby
      t.string :name_en
      t.text :description
      t.timestamps
    end
    add_index :people, :uid, unique:true
    %i(email yp_ldap_uid yp_garoon_uid name name_ruby name_en description).each do |column|
      add_index :people, column
    end
  end
end
