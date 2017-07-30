class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|  
      t.string :school_name
      t.string :school_description

      t.string :school_city
      t.string :school_area

      t.string :school_curriculum
      t.string :school_certificate
      t.string :school_eduSystem

      t.boolean :school_foreignTeachers
      t.string  :school_feesRange
      t.string  :school_availableGrades
      t.integer :school_age

      t.string :school_website
      t.string :school_telephone
      t.string :school_email
      t.string :school_app
      t.string :school_address

      t.string :admission_status
      t.string :admission_email
          
      t.boolean :school_cafeteria
      t.boolean :school_soccerPlayground
      t.boolean :school_InnovationSpaces
      t.boolean :school_theater
      t.boolean :school_computerLabs
      t.boolean :school_scienceLab
      t.boolean :school_library  
      t.boolean :school_swimmingPool

      t.string :school_logo 
      t.json   :school_images 
      t.string :token

      t.timestamps null: false
    end
  end
end
