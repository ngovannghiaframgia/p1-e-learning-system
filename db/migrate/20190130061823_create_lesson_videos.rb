class CreateLessonVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_videos do |t|
      t.references :lesson, foreign_key: true
      t.references :video, foreign_key: true

      t.timestamps
    end
    add_index :lesson_videos, [:lesson_id, :created_at]
    add_index :lesson_videos, [:video_id, :created_at]
  end
end
