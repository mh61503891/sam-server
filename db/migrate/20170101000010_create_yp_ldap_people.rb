class CreateYpLdapPeople < ActiveRecord::Migration[5.0]
  def change
    create_table :yp_ldap_people do |t|
      # person
      t.string :dn, null:false
      t.string :sn              # [must]
      t.string :cn              # [must]
      t.string :telephoneNumber # [may]
      t.string :description     # [may]
      # organizationalPerson
      t.string :title           # [may]
      # inetOrgPerson
      t.string :displayName     # [may]
      t.string :givenName       # [may]
      t.string :mail            # [may]
      t.timestamps
    end
    add_index :yp_ldap_people, :dn, unique:true
    %i(sn cn telephoneNumber description title displayName givenName mail).each do |column|
      add_index :yp_ldap_people, column
    end
  end
end
