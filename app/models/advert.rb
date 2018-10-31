class Advert < ApplicationRecord
  belongs_to :vehicle, polymorphic: true
  belongs_to :user, optional: true
  belongs_to :location, optional: true
  has_many :photos
  belongs_to :brand, optional: true
  belongs_to :currency
  # has_many_attached :photos

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

  TIMES = {
      hours: (0..23).to_a.map{|h| h < 10 ? '0'+h.to_s : h.to_s },
      minutes: %w(00 15 30 45)
  }

  HINTS = {
      pictures: {
          ru: 'Запрещается размещение на фото контактной информации, а также ретушь с целью выделения фото среди других. Не рекомендуется добавление фотографий, размещенных в других объявлениях о продаже.',
          en: ''
      },
      brand: {
          ru: 'Если Вы не нашли нужную марку в списке, Вы можете выбрать "Другая", а свою указать в поле "Модель"',
          en: ''
      },
      contacts: {
          ru: 'Указывайте достоверный Email адрес, так как на него придет пароль для входа в личный кабинет',
          en: ''
      }
  }

  DISTANCES = %w(25 50 100)

  VEHICLE_TYPES = {
      ru: %w(Велосипеды Электровелосипеды Веломобили Моноколеса Гироскутеры Гироциклы Электросамокаты Электроскутеры Электромотоциклы),
      en: %w()
  }

  validates :location_id, presence: {message: 'Выберите город'}
  validates :country_id, presence: {message: 'Выберите страну'}
  validates :name, presence: {message: 'Заполните это поле'}
  validates :phone, presence: {message: 'Телефон не может быть пустым'}
  validates :email, presence: {message: 'Email не может быть пустым'}
  validates :price, presence: {message: 'Цена не может быть пустой'}, numericality: { greater_than: 10, less_than: 1000000 , message: ->(object, data) {
    mes = 'Цена должна быть в диапазоне от 10 до 1 000 000'
    # if object.currency_id == 1
    #   mes += 'от 500 до 1 500 000'
    # elsif object.currency_id == 2
    #   mes += 'от 10 до 25 000'
    # elsif object.currency_id == 3
    #   mes += 'от 10 до 20 000'
    # end
    mes
  }}
  validates :brand_id, presence: {message: 'Выберите марку'}
  validates :model, presence: {message: 'Введите модель'}

  def self.vehicle_type_condition(adverts, type)
    case type
    when 0
      Advert.joins('inner join bicycles b on adverts.vehicle_id = b.id')
    when 1
      Advert.joins('inner join bicycles b on adverts.vehicle_id = b.id').where('b.c10 is true')
    end
  end
end
