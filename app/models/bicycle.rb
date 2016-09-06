class Bicycle < ApplicationRecord
  include VehicleValidates

  belongs_to :brand
  has_many :adverts, as: :vehicle


end
