class AddExpireToSchools < ActiveRecord::Migration[5.1]

  def change
   add_column :schools, :expire, :datetime
  end
end
