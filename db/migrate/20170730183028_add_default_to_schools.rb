class AddDefaultToSchools < ActiveRecord::Migration[5.1]
  def change
    change_column :schools, :status, :boolean, default: false
  end
end
