class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.string :text
      t.datetime :date
      t.references :school
      t.timestamps
    end
  end
end
