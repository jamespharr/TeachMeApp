class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :description
      t.string :start_time
      t.string :end_time
      t.string :location
      t.integer :attendees_number
      t.string :duration
      t.string :student_requirements
      t.string :supplied_by_teacher
      t.string :comments
      t.belongs_to :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
