class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :usr_vname
      t.string  :usr_email
      t.string  :usr_tel
      
      #t.date    :usr_dob
      t.string  :usr_address
      t.string  :usr_gover
      t.string  :usr_city
      
      t.string  :usr_logo
      t.integer :usr_delivery #0:home, 1:in shop, 2:both
      t.string   :usr_description
      
      #t.string :usr_country
      t.string :password_digest

      t.references :categories,  index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
