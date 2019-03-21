class CreateHomeworkResults < ActiveRecord::Migration[5.2]
  def change
    create_table :homework_results do |t|
      t.text :comment
      t.references :exercises_answer, foreign_key: true
      t.references :user, foreign_key: true
      t.references :homework, foreign_key: true
      t.references :homeworks_detail, foreign_key: true

      t.timestamps
    end
    add_index :homework_results, [:user_id, :created_at]
    add_index :homework_results, [:homework_id, :created_at]
    add_index :homework_results, [:exercises_answer_id, :created_at]
    add_index :homework_results, [:homeworks_detail_id, :created_at]
  end
end
