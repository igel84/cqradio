class AddCountItemToCard < ActiveRecord::Migration
  def self.up
  	add_column :cards, :count, :integer, :default=>0
  end

  def self.down
  	remove_column :cards, :count
  end
end
