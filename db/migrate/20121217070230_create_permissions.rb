class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.references :folder
      t.boolean :can_create
      t.boolean :can_read
      t.boolean :can_update
      t.boolean :can_delete

      t.timestamps
    end
    add_index :permissions, :folder_id
  end
end
