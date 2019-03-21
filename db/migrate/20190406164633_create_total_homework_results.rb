class CreateTotalHomeworkResults < ActiveRecord::Migration[5.2]
  def change
    create_table :total_homework_results do |t|
      t.string :comment
      t.references :user, foreign_key: true
      t.references :homework, foreign_key: true
      t.integer :total_true
      t.integer :total_false
      t.integer :reward_points

      t.timestamps
    end
  end
end
