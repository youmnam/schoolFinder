class CreateJobVacancies < ActiveRecord::Migration
  def change
    create_table :job_vacancies do |t|
      t.string   :title
      t.text     :description
      t.text     :qualifications
      t.datetime :opened_at
     
      t.string   :school_name
      t.string   :school_id
     
      t.timestamps null: false
    end
  end
end
