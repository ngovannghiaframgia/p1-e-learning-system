class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.references :subject, foreign_key: true
      t.references :user, foreign_key: true
      t.string :name_class
      t.string :quantity
      t.date :start_time

      t.timestamps
    end
    add_index :courses, [:subject_id, :created_at]
    add_index :courses, [:user_id, :created_at]
  end
end
