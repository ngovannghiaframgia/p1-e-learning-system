class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :fullname
      t.date :birth
      t.integer :gender
      t.string :address
      t.string :numberphone
      t.integer :role, null: false, default: 0
      t.string :avt
      t.boolean :active
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
