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

      t.timestamps
    end
  end
end
