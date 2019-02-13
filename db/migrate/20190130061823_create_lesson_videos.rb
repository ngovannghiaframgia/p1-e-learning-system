class CreateLessonVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_videos do |t|
      t.references :lesson, foreign_key: true

      t.timestamps
    end
    add_index :lesson_videos, [:lesson_id, :created_at]
  end
end
