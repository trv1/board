class Bicycle < ApplicationRecord
  include BicycleValidates

  belongs_to :brand
  has_many :adverts, as: :vehicle


end
