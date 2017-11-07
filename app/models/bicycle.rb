class Bicycle < ApplicationRecord
  include BicycleValidates

  belongs_to :brand, optional: true
  has_one :adverts, as: :vehicle
end
