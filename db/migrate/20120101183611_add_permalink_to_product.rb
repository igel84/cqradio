class AddPermalinkToProduct < ActiveRecord::Migration
  def self.up
  	add_column :products, :hiperlink, :string
  end

  def self.down
  	remove_column :products, :hiperlink
  end
end
