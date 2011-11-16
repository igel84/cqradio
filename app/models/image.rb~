class Image < ActiveRecord::Base
  belongs_to :product
  has_attached_file :photo, :styles => { :thumb=> "100x100#", :small  => "250x250>", :normal => "600x600>" }
end
