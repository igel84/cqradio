class Card < ActiveRecord::Base
	has_many :card_items
	belongs_to :user
end
