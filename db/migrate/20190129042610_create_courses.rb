class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.references :subject, foreign_key: true
      t.references :user, foreign_key: true
      t.string :course_name
      t.string :quantity_registered
      t.decimal :price, precision: 20, scale: 2
      t.string :description
      t.date :start_time

      t.timestamps
    end
    add_index :courses, [:subject_id, :created_at]
    add_index :courses, [:user_id, :created_at]
  end
end
