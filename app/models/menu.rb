class Menu < ActiveRecord::Base
  acts_as_nested_set
  attr_accessible :name, :parent_id
  has_many :products, :dependent => :destroy
end
