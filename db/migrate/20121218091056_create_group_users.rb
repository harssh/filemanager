class CreateGroupUsers < ActiveRecord::Migration
  def self.up
    create_table :group_users, :id => false do |t|
      t.references :group
      t.references :user
    end
  end

  def self.down
    drop_table :group_users
  end
end
