class CreateHomeworkResults < ActiveRecord::Migration[5.2]
  def change
    create_table :homework_results do |t|
      t.decimal :total_score
      t.decimal :reward_points
      t.text :comment
      t.references :user, foreign_key: true
      t.references :homework, foreign_key: true

      t.timestamps
    end
    add_index :homework_results, [:user_id, :created_at]
    add_index :homework_results, [:homework_id, :created_at]
  end
end
