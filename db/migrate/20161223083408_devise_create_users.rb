class DeviseCreateUsers < ActiveRecord::Migration[5.0]

  def change

    # Columns
    create_table :users do |t|
      # Database authenticatable
      t.string :email
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
      # uid for LDAP
      t.string :uid, null:false
      t.integer :role, default:0, null:false
      # Params
      t.string :name
      t.string :name_ruby
      t.string :name_en
      t.string :title
      t.string :title_ruby
      t.string :title_en
    end

    # Indexes
    %i(email uid role, name name_ruby name_en title title_ruby title_en).each do |column|
      add_index :users, column
    end

  end
end
