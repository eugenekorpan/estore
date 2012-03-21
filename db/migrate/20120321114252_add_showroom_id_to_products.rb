class AddShowroomIdToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :showroom_id, :integer
  end

  def self.down
    remove_column :products, :showroom_id
  end
end
