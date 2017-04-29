class CreateCarCats < ActiveRecord::Migration
  def change
    create_table :car_cats do |t|
      t.string  :Name
      t.decimal :Price
      t.timestamps null: false
    end
  end
end
