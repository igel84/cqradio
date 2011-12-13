class CreateCards < ActiveRecord::Migration
  def self.up
    create_table :cards do |t|
      t.integer :user_id
      t.boolean :enable
      t.integer :stady

      t.timestamps
    end
  end

  def self.down
    drop_table :cards
  end
end
