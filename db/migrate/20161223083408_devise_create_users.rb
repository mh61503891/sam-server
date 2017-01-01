class DeviseCreateUsers < ActiveRecord::Migration[5.0]

  def change

    create_table :users do |t|
      # Authenticatable
      t.string :uid, null:false
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
      # Options
      t.string :email
      t.string :name
      t.string :name_ruby
      t.string :name_en
      t.string :title
      t.string :title_ruby
      t.string :title_en
    end

    add_index :users, :uid, unique:true
    %i(email name name_ruby name_en title title_ruby title_en).each do |column|
      add_index :users, column
    end

  end
end
