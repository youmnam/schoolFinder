class CreateRenters < ActiveRecord::Migration
  def change
    create_table :renters do |t|
      t.string :renter_name
      t.string :renter_email

	  t.string :password_digest
      t.timestamps null: false
    end
  end
end
