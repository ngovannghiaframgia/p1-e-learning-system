class CreateExercisesAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises_answers do |t|
      t.text :content
      t.boolean :is_current
      t.references :exercise, foreign_key: true

      t.timestamps
    end
    add_index :exercises_answers, [:exercise_id, :created_at]
  end
end
