class Advert < ApplicationRecord
  belongs_to :vehicle, polymorphic: true
  belongs_to :user
  belongs_to :location
  has_many :photos
end
