class AddSummToCard < ActiveRecord::Migration
  def self.up
  	add_column :cards, :summ, :float, :default=>0
  end

  def self.down
  	remove_column :cards, :summ
  end
end
