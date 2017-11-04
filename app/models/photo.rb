class Photo < ApplicationRecord
  has_attached_file :image, styles: { medium: "1200x600>", thumb: "200x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage/
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 2.megabytes
  belongs_to :advert, optional: true
end
