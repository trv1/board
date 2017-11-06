class Bicycle < ApplicationRecord
  include BicycleValidates

  belongs_to :brand
  has_one :adverts, as: :vehicle
end
