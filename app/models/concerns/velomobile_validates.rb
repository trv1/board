module VelomobileValidates
  extend ActiveSupport::Concern
  include BicycleValidates
  
  included do
    validates :c2, inclusion: {in: BicycleValidates::C7}
    validates :c4, inclusion: {in: BicycleValidates::C14}
    validates :c9, inclusion: {in: BicycleValidates::C33}
    validates :c10, inclusion: {in: BicycleValidates::C34}
    validates :c14, inclusion: {in: BicycleValidates::LEVELS}
    validates :c15, inclusion: {in: BicycleValidates::LEVELS}
    validates :c16, inclusion: {in: BicycleValidates::LEVELS}
    validates :c17, inclusion: {in: BicycleValidates::LEVELS}
    validates :c19, inclusion: {in: BicycleValidates::LEVELS}
    validates :c29, inclusion: {in: BicycleValidates::LEVELS}
    validates :c31, inclusion: {in: BicycleValidates::LEVELS}
    validates :c18, inclusion: {in: BicycleValidates::C45}
    validates :c20, inclusion: {in: BicycleValidates::C47}
    validates :c21, inclusion: {in: BicycleValidates::C48}
    validates :c28, inclusion: {in: BicycleValidates::C55}
    validates :c30, inclusion: {in: BicycleValidates::BREAKS}
    validates :c32, inclusion: {in: BicycleValidates::BREAKS}
    validates :c36, inclusion: {in: BicycleValidates::C71}
    validates :c49, inclusion: {in: BicycleValidates::C80}
    validates :c53, inclusion: {in: BicycleValidates::C87}
  end
end