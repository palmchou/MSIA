class Slideshow < ActiveRecord::Base
    has_attached_file :slide, :styles => { :content => '700x350>', :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :slide, :content_type => /\Aimage\/.*\Z/
    validates_attachment_presence :slide
    validates_attachment_size :slide, :less_than => 2.megabytes

  def smart_url
    self.url if ! self.url.nil?
    '#'
  end
end
