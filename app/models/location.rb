class Location < ApplicationRecord
  has_many :adverts
  belongs_to :parent, class_name: "Location"
end
