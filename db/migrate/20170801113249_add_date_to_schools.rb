class AddDateToSchools < ActiveRecord::Migration[5.1]
  def change
    change_column :schools, :expire, :date
  end
end
