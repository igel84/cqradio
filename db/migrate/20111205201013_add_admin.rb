class AddAdmin < ActiveRecord::Migration
  def self.up
  	User.create(:name=>'admin', :password=>'dtktc7793',:password_confirmation=>'dtktc7793', :admin=>true, :email=>'admin@cqradio.ru')
  end

  def self.down
  end
end
