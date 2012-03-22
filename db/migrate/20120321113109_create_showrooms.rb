class CreateShowrooms < ActiveRecord::Migration
  def self.up
    create_table :showrooms do |t|
      t.string :title     
      t.integer :products_count, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :showrooms
  end
end
