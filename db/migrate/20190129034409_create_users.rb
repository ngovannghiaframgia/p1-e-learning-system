class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :fullname
      t.date :birth
      t.integer :gender
      t.string :address
      t.references :role, foreign_key: true
      t.string :avt
      t.boolean :active

      t.timestamps
    end
    add_index :users, [:role_id, :created_at]
  end
end
