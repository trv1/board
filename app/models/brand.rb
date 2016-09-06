class Brand < ApplicationRecord
  has_many :bicycles
  has_many :velomobiles
end
