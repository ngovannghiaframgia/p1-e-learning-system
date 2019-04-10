class CreateExercisesAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises_answers do |t|
      t.text :content
      t.integer :is_current, null: false, default: 0
      t.references :exercise, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :exercises_answers, [:exercise_id, :created_at]
    add_index :exercises_answers, [:user_id, :created_at]
  end
end
