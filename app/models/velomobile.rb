class Velomobile < ApplicationRecord
  include VelomobileValidates

  belongs_to :brand
  has_many :adverts, as: :vehicle
end
