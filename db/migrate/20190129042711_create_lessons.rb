class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :content
      t.references :user, foreign_key: true
      t.references :course, foreign_key: true
      t.references :video, foreign_key: true

      t.timestamps
    end
    add_index :lessons, [:user_id, :created_at]
    add_index :lessons, [:course_id, :created_at]
    add_index :lessons, [:video_id, :created_at]
  end
end
