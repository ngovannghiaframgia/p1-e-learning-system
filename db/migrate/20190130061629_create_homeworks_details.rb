class CreateHomeworksDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :homeworks_details do |t|
      t.references :homework, foreign_key: true
      t.references :exercise, foreign_key: true

      t.timestamps
    end
    add_index :homeworks_details, [:homework_id, :created_at]
    add_index :homeworks_details, [:exercise_id, :created_at]
  end
end
