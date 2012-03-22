class CreateProductShowrooms < ActiveRecord::Migration
  def self.up
    create_table :products_showrooms, :id => false do |t|
      t.integer :product_id
      t.integer :showroom_id
    end
  end

  def self.down
    drop_table :product_showrooms
  end
end
