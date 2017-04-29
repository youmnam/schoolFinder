class CreateItemSpecs < ActiveRecord::Migration
  def change
    create_table :item_specs do |t|
      t.references :item, index: true, foreign_key: true
      t.references :category_filter, index: true, foreign_key: true
      t.string     :value

      t.timestamps null: false
    end
  end
end
