class Velomobile < ApplicationRecord
  include VelomobileValidates

  belongs_to :brand
  has_one :adverts, as: :vehicle
end
