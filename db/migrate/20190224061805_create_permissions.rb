class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions do |t|
      t.string :name_permission
      t.string :path
      t.integer :role_id
      t.string :icon
    end
  end
end
