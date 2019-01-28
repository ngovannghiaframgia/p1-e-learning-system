class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :name_video
      t.string :link
      t.integer :lesson_number
      t.string :description
      t.references :subject, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :videos, [:subject_id, :created_at]
    add_index :videos, [:user_id, :created_at]
  end
end
