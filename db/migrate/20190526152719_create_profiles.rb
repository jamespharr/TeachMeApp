class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :profile_title
      t.string :description
      t.string :skills
      t.string :education_level
      t.string :certifications
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
