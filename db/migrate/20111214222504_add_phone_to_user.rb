class AddPhoneToUser < ActiveRecord::Migration
  def self.up
  	add_column :users, :phone, :string, :default=>''
  end

  def self.down
  	remove_column :users, :phone
  end
end
