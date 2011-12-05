class AddPages < ActiveRecord::Migration
  def self.up
  	Page.create(:name=>'Главная', :title=>'Главная', :body=>'Главная')
  	Page.create(:name=>'Доставка', :title=>'Доставка', :body=>'Доставка')
  	Page.create(:name=>'Контакты', :title=>'Контакты', :body=>'Контакты')
  end

  def self.down
  end
end
