class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.references :subject, foreign_key: true
      t.references :user, foreign_key: true
      t.string :course_name
      t.integer :quantity_registered
      t.date :start_time
      t.string :description
      t.decimal :price, precision: 20, scale: 2

      t.timestamps
    end
    add_index :courses, [:subject_id, :created_at]
    add_index :courses, [:user_id, :created_at]
  end
end
