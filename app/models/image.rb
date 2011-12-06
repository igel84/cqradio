class Image < ActiveRecord::Base
  belongs_to :product
  has_attached_file :photo, :styles => {
  	:thumb=> ["100x100#", :jpg], :small  => ["250x250>", :jpg], :normal => ["600x600>", :jpg]
  	#,:preview => { :processors => [:watermark], :geometry => '300x300>', :watermark_path => "#{Rails.root}/public/images/watermark.png", :position => 'Center', :format =>:jpg, :convert_options => ['image/jpeg'] }
  }
end
