class CreateUserFiles < ActiveRecord::Migration
  def change
    create_table :user_files do |t|
      t.string :attachment_file_name
      t.string :attachment_content_type
      t.integer :attachment_file_size
      t.datetime :attachment_updated_at
      t.references :folder
      t.references :user

      t.timestamps
    end
    add_index :user_files, :folder_id
    add_index :user_files, :user_id
  end
end
