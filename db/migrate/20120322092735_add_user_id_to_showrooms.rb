class AddUserIdToShowrooms < ActiveRecord::Migration
  def self.up
    add_column :showrooms, :user_id, :integer
  end

  def self.down
    remove_column :showrooms, :user_id
  end
end
