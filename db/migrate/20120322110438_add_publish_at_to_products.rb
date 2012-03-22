class AddPublishAtToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :publish_at, :date, :default => Date.today
  end

  def self.down
    remove_column :products, :publish_at
  end
end
