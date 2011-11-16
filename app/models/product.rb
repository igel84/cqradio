class Product < ActiveRecord::Base
  #acts_as_nested_set
  acts_as_list :scope => "position"
  belongs_to :menu
  has_attached_file :datasheet #, :styles => { :thumb=> "100x100#", :small  => "250x250>", :normal => "600x600>" }
  has_many :images, :dependent => :destroy
end
