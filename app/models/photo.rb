class Photo < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 2.megabytes
  belongs_to :advert
end
