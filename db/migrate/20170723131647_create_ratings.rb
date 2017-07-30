class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :rate1
      t.integer :rate2
      t.integer :rate3
      t.integer :rate4
      t.references :school, index: true, foreign_key: true
      t.timestamps null: false
      t.text :username
      t.text :email
      t.text :comment
    end
  end
end
