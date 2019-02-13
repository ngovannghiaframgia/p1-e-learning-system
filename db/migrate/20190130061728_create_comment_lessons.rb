class CreateCommentLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_lessons do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :lesson, foreign_key: true

      t.timestamps
    end
    add_index :comment_lessons, [:user_id, :created_at]
    add_index :comment_lessons, [:lesson_id, :created_at]
  end
end
