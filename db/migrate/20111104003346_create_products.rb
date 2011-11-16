class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.text :info
      t.integer :balance
      t.float :price
      t.integer :menu_id
      t.integer :position
      t.boolean :visible, :default => true
      
      t.string :datasheet_file_name
      t.string :datasheet_content_type
      t.integer :datasheet_file_size
      t.datetime :datasheet_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
