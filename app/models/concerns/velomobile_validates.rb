module VelomobileValidates
  extend ActiveSupport::Concern
  include BicycleValidates
  
  included do
    validates :c2, inclusion: {in: 0...BicycleValidates::C7['ru'].size}
    validates :c4, inclusion: {in: 0...BicycleValidates::C14['ru'].size}
    validates :c9, inclusion: {in: 0...BicycleValidates::C33['ru'].size}
    validates :c10, inclusion: {in: 0...BicycleValidates::C34['ru'].size}
    validates :c14, inclusion: {in: 0...BicycleValidates::LEVELS['ru'].size}
    validates :c15, inclusion: {in: 0...BicycleValidates::LEVELS['ru'].size}
    validates :c16, inclusion: {in: 0...BicycleValidates::LEVELS['ru'].size}
    validates :c17, inclusion: {in: 0...BicycleValidates::LEVELS['ru'].size}
    validates :c19, inclusion: {in: 0...BicycleValidates::LEVELS['ru'].size}
    validates :c29, inclusion: {in: 0...BicycleValidates::LEVELS['ru'].size}
    validates :c31, inclusion: {in: 0...BicycleValidates::LEVELS['ru'].size}
    validates :c18, inclusion: {in: 0...BicycleValidates::C45['ru'].size}
    validates :c20, inclusion: {in: 0...BicycleValidates::C47['ru'].size}
    validates :c21, inclusion: {in: 0...BicycleValidates::C48['ru'].size}
    validates :c28, inclusion: {in: 0...BicycleValidates::C55['ru'].size}
    validates :c30, inclusion: {in: 0...BicycleValidates::BREAKS['ru'].size}
    validates :c32, inclusion: {in: 0...BicycleValidates::BREAKS['ru'].size}
    validates :c36, inclusion: {in: 0...BicycleValidates::C71['ru'].size}
    validates :c49, inclusion: {in: 0...BicycleValidates::C80['ru'].size}
    validates :c53, inclusion: {in: 0...BicycleValidates::C87['ru'].size}
  end
end