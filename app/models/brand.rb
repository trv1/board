class Brand < ApplicationRecord
  OTHER = {
      ru: 'Другая',
      en: 'Another'
  }

  has_many :bicycles
  has_many :velomobiles

  scope :other, ->{ where(name: 'Other') }
end
