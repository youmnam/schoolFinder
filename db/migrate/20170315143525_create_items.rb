class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :item_name
      t.string  :item_desc
      t.decimal :item_price
      t.string  :item_per
      t.string  :item_maxp
      t.string  :item_minp
      t.integer :item_status #0:like new, 1:very good, 2:acceptable 
      t.integer :item_available #0:not available, 1:available 2:not available for a period
      t.string  :item_nviews
      t.string  :item_nvreqs

      t.references :user, index: true, foreign_key: true,null: false
	    t.references :category, index: true, foreign_key: true,null: false
      t.timestamps null: false
    end
  end
end
