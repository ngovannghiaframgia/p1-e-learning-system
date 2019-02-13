class CreateHomeworks < ActiveRecord::Migration[5.2]
  def change
    create_table :homeworks do |t|
      t.string :name_homework
      t.integer :lesson_number
      t.string :total_exercise
      t.references :lesson, foreign_key: true

      t.timestamps
    end
    add_index :homeworks, [:lesson_id, :created_at]
  end
end
