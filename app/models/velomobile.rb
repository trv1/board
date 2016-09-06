class Velomobile < ApplicationRecord
  belongs_to :brand
  has_many :adverts, as: :vehicle
end
