class CreateCardItems < ActiveRecord::Migration
  def self.up
    create_table :card_items do |t|
      t.integer :product_id
      t.integer :count
      t.integer :price
      t.integer :summ
      t.integer :card_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :card_items
  end
end
