class AddStatusToSchools < ActiveRecord::Migration[5.1]
  def change
    add_column :schools, :status, :boolean
  end
end
