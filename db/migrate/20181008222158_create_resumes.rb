class CreateResumes < ActiveRecord::Migration[5.2]
  def change
    create_table :resumes do |t|
      t.string :job_type
      t.string :location
      t.string :desired_salary
      t.string :timing
      t.string :age
      t.string :skills
      t.string :capacity
      t.string :languages
      t.string :employment_pattern
      t.text :note
      t.text :comment
      t.string :image

      t.boolean :job_type_chk           ,default: true
      t.boolean :location_chk           ,default: true
      t.boolean :desired_salary_chk     ,default: true
      t.boolean :timing_chk             ,default: false
      t.boolean :age_chk                ,default: true
      t.boolean :skills_chk             ,default: true
      t.boolean :capacity_chk           ,default: false
      t.boolean :languages_chk          ,default: false
      t.boolean :employment_pattern_chk ,default: false
      t.boolean :note_chk               ,default: true
      t.boolean :state                  ,default: true
      t.string :slug

      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :resumes, [:user_id, :created_at]
  end
end
