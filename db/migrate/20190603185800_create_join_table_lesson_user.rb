class CreateJoinTableLessonUser < ActiveRecord::Migration[6.0]
  def change
    create_join_table :lessons, :users do |t|
      t.index [:lesson_id, :user_id]
      # t.index [:user_id, :lesson_id]
    end
  end
end
