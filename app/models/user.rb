class User < ApplicationRecord
  has_secure_password
  has_many :adverts

  validates :name, presence: true
  validates :phone, presence: true
end
