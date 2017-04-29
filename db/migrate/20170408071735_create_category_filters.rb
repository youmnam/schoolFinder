class CreateCategoryFilters < ActiveRecord::Migration
  def change
    create_table :category_filters do |t|
      t.string     :nameOfLabel
      t.string     :typeOfLabel
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
