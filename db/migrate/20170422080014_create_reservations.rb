class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :item, index: true, foreign_key: true
      t.references :renter, index: true, foreign_key: true
      t.date    :from
      t.date    :to
      t.string  :name
      t.string  :email
      t.integer :status #0:not accepted either rejected, 1: accepted, 2:rejected

      t.timestamps null: false
    end
  end
end
