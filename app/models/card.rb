class Card < ActiveRecord::Base
	has_many :card_items, :dependent => :destroy
	belongs_to :user
end
