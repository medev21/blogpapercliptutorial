class Paragraph < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  has_attached_file :content_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :content_image, content_type: /\Aimage\/.*\Z/

end
