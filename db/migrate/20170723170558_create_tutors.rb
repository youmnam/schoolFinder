class CreateTutors < ActiveRecord::Migration[5.1]
  def change
    create_table :tutors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text   :phone
      
      t.text   :description
      t.string :current_job
      t.text   :qualifications
      t.timestamps null: false
    end
  end
end
