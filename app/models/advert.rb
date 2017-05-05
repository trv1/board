class Advert < ApplicationRecord
  belongs_to :vehicle, polymorphic: true
  belongs_to :user
  belongs_to :location
  has_many :photos

  STATES = {
      ru: %w(Отличное Хорошее Среднее Плохое Убитый),
      en: %w(Excellent Good Middle Bad Killed),
  }

  COLORS = {
      code: %w(F5F5DC FFFFFF 42AAFF FFFF00 008000 FFD700 964B00 FF0000 FFA500 FC0FC0 C0C0C0 808080 0000FF 8B00FF 000000),
      name: {
        ru: %w(Бежевый Белый Голубой Желтый Зеленый Золотистый Коричневый Красный Оранжевый Розовый Серебристый Серый Синий Фиолетовый Черный),
        en: %w(Beige White Blue Yellow Green Golden Brown Red Orange Pink Silver Gray Dark\ Blue Purple Black)
      }
  }
end
