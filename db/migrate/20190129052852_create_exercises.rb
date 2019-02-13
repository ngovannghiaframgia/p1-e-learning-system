class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.text :question
      t.text :detailed_answer
      t.integer :lesson_number
      t.references :subject, foreign_key: true

      t.timestamps
    end
    add_index :exercises, [:subject_id, :created_at]
  end
end
