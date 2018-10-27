module BicycleValidates
  extend ActiveSupport::Concern

  C1 = {
      ru: %w(BMX Горный\ (MTB) Горный\ гибрид Городской Дорожный Круизер Фэт-байк Шоссейный Шоссейный\ гибрид),
      en: %w(BMX Mountain\ (MTB) Mountain\ hybrid Urban Road Cruiser Fat-bike Highway Highway\ hybrid),
  }
  C2 = {
      ru: %w(Детский Подростковый Для\ взрослых),
      en: %w(Children Teen Adult),
  }
  C3 = {
      ru: %w(Вседорожный Даунхилл Дёрт Кросс-кантри Стрит Трековый Триал Туринг Фрирайд Циклокросс),
      en: %w(All\ mountain Downhill Dirt Cross\ country Street Track Trial Touring Freeride Cyclocross),
  }
  C4 = {
      ru: %w(От\ 2\ до\ 4\ лет\ ростом\ до\ 105\ см От\ 3\ до\ 5\ лет\ ростом\ до\ 115\ см От\ 4\ до\ 6\ лет\ ростом\ до\ 125\ см От\ 6\ до\ 9\ лет\ ростом\ до\ 135\ см От\ 9\ до\ 15\ лет\ ростом\ до\ 135\ см),
      en: %w(2\ -\ 4\ years\ old\ (height\ up\ to\ 105\ cm) 3\ -\ 5\ years\ old\ (height\ up\ to\ 115\ cm) 4\ -\ 6\ years\ old\ (height\ up\ to\ 125\ cm) 6\ -\ 9\ years\ old\ (height\ up\ to\ 135\ cm) 9\ -\ 15\ years\ old\ (height\ up\ to\ 135\ cm)),
  }
  C5 = {
      ru: %w(Женский Унисекс),
      en: %w(Female Unisex),
  }
  C7 = {
      ru: %w(Двухколесный Трехколесный Четырехколесный),
      en: %w(Two-wheel Three-wheel Four-wheel),
  }
  C14 = {
      ru: %w(Алюминиевый\ сплав Карбон\ (углепластик) Карбон/алюминий Магниевый\ сплав Пластик Сталь Титановый\ сплав Хроммолибденовый\ сплав),
      en: %w(Aluminium\ alloy Carbon Carbon/aluminum Magnesium\ alloy Plastic Steel Titanium\ alloy Chromium-molybdenum\ alloy),
  }
  C17 = {
      ru: %w(Hard\ tail Rigid\ (жесткий) Двухподвесный),
      en: %w(Hard\ tail Rigid\ (hard) Dual-suspension),
  }
  C18 = {
      ru: %w(Начальный Прогулочный Профессиональный Спортивный),
      en: %w(Elementary Walking Professional Sports),
  }
  C20 = {
      ru: %w(Воздушная Воздушно-масляная Жесткая Пружинная Пружинно-масляная Пружинно-эластомерная),
      en: %w(Air Air-oil Hard Spring Spring-oil Spring-elastomeric),
  }
  C33 = {
      ru: %w(Алюминиевый\ сплав Алюминий/карбон Алюминий/скандий Карбон\ (углепластик) Скандий Скандий/карбон Сталь),
      en: %w(Aluminium\ alloy Aluminum/carbon Aluminum/scandium Carbon Scandium Scandium/carbon Steel),
  }
  C34 = {
      ru: %w(Кевлар Металл),
      en: %w(Kevlar Metal)
  }
  # 41,42,43,44,46,56,58
  LEVELS = {
      ru: %w(Начальный Полупрофессиональный Прогулочный Профессиональный Спортивный),
      en: %w(Elementary Half-professional Walking Professional Sports),
  }
  C45 = {
      ru: %w(Bar\ End Dual\ Control Dual\ Drive Вращающаяся\ ручка Однорычажные Триггерные\ двухрычажные Триггерные\ однорычажные),
      en: %w(Bar\ End Dual\ Control Dual\ Drive Rotating\ handle Single\ lever Trigger\ two\ lever Trigger\ single\ lever),
  }
  C47 = {
      ru: %w(Интегрированнная Неинтегрированнная),
      en: %w(Integrated Non-integrated),
  }
  C48 = {
      ru: %w(Howitzer ISIS Octalink Power\ Spline Квадрат),
      en: %w(Howitzer ISIS Octalink Power\ Spline Square),
  }
  C55 = {
      ru: %w(Классическая Платформы С\ контактами С\ тулклипсами),
      en: %w(Classical Platform\ with\ contacts With\ tool\ clips),
  }
  # 57,59
  BREAKS = {
      ru: %w(V-Brake Дисковый\ гидравлический Дисковый\ механико-гидравлический Дисковый\ механический Кантиливер Клещевой Ножной Ободной\ гидравлический Роллерный Отсутствует),
      en: %w(V-Brake Disc\ hydraulic Disc\ mechanical-hydraulic Disc\ mechanical Cantilever Caliper Pedals Rim\ hydraulic Roller Without\ brake),
  }
  C60 = {
      ru: %w(Вальный Ременной Цепной),
      en: %w(Shaft Belt Chain),
  }
  C64 = {
      ru: %w(Резьбовая Безрезьбовая),
      en: %w(Threaded Threadless),
  }
  C65 = {
      ru: %w(1\ 1/2\" 1\ 1/4\" 1\ 1/8\" 1\ 1/8\"\ -\ 1\ 1/2\" 1\"),
      en: %w(1\ 1/2\" 1\ 1/4\" 1\ 1/8\" 1\ 1/8\"\ -\ 1\ 1/2\" 1\"),
  }
  C66 = {
      ru: %w(Интегрированная Полуинтегрированная Неинтегрированная),
      en: %w(Integrated Half-integrated Non-integrated),
  }
  C69 = {
      ru: %w(Изогнутый Прямой Шоссейный),
      en: %w(Curved Straight Highway),
  }
  C70 = {
      ru: %w(Ванадиевый\ сплав Марганцевый\ сплав Нихромовый\ сплав Сталь Титановый\ сплав Углепластик Хром-кремниевый\ сплав Хроммолибденовый\ сплав),
      en: %w(Vanadium\ alloy Manganese\ alloy Nichrome\ alloy Steel Titanium\ alloy Carbon Chrome-silicon\ alloy Chrome-molybdenum\ alloy),
  }
  C71 = {
      ru: %w(Искусственная\ кожа Кожа Кожа\ +\ кевлар Пластик Синтетическая\ ткань),
      en: %w(Leatherette Leather Leather\ +\ Kevlar Plastic Synthetic\ fabric),
  }
  # 76,87
  POSITIONS = {
      ru: %w(Передний Задний Передний\ и\ задний),
      en: %w(Front Rear Front\ and\ rear),
  }
  C80 = {
      ru: %w(LFP Li-ion LiMn LiPo SLA),
      en: %w(LFP Li-ion LiMn LiPo SLA),
  }
  C98 = {
      ru: %w(Левое Правое Левое\ и\ правое),
      en: %w(Left Right Left\ and\ right),
  }
  C100 = {
      ru: %w(Передний Задний Полный),
      en: %w(Front-wheel Rear-wheel All-wheel)
  }

  included do
    validates :c1, inclusion: {in: 0...C1[:ru].size}, allow_blank: true
    validates :c2, inclusion: {in: 0...C2[:ru].size}, allow_blank: true
    validates :c3, inclusion: {in: 0...C3[:ru].size}, allow_blank: true
    validates :c4, inclusion: {in: 0...C4[:ru].size}, allow_blank: true
    validates :c5, inclusion: {in: 0...C5[:ru].size}, allow_blank: true
    validates :c7, inclusion: {in: 0...C7[:ru].size}, allow_blank: true
    validates :c14, inclusion: {in: 0...C14[:ru].size}, allow_blank: true
    validates :c17, inclusion: {in: 0...C17[:ru].size}, allow_blank: true
    validates :c18, inclusion: {in: 0...C18[:ru].size}, allow_blank: true
    validates :c20, inclusion: {in: 0...C20[:ru].size}, allow_blank: true
    validates :c33, inclusion: {in: 0...C33[:ru].size}, allow_blank: true
    validates :c34, inclusion: {in: 0...C34[:ru].size}, allow_blank: true
    validates :c41, inclusion: {in: 0...LEVELS[:ru].size}, allow_blank: true
    validates :c42, inclusion: {in: 0...LEVELS[:ru].size}, allow_blank: true
    validates :c43, inclusion: {in: 0...LEVELS[:ru].size}, allow_blank: true
    validates :c44, inclusion: {in: 0...LEVELS[:ru].size}, allow_blank: true
    validates :c46, inclusion: {in: 0...LEVELS[:ru].size}, allow_blank: true
    validates :c56, inclusion: {in: 0...LEVELS[:ru].size}, allow_blank: true
    validates :c58, inclusion: {in: 0...LEVELS[:ru].size}, allow_blank: true
    validates :c45, inclusion: {in: 0...C45[:ru].size}, allow_blank: true
    validates :c47, inclusion: {in: 0...C47[:ru].size}, allow_blank: true
    validates :c48, inclusion: {in: 0...C48[:ru].size}, allow_blank: true
    validates :c55, inclusion: {in: 0...C55[:ru].size}, allow_blank: true
    validates :c57, inclusion: {in: 0...BREAKS[:ru].size}, allow_blank: true
    validates :c59, inclusion: {in: 0...BREAKS[:ru].size}, allow_blank: true
    validates :c60, inclusion: {in: 0...C60[:ru].size}, allow_blank: true
    validates :c64, inclusion: {in: 0...C64[:ru].size}, allow_blank: true
    validates :c65, inclusion: {in: 0...C65[:ru].size}, allow_blank: true
    validates :c66, inclusion: {in: 0...C66[:ru].size}, allow_blank: true
    validates :c69, inclusion: {in: 0...C69[:ru].size}, allow_blank: true
    validates :c70, inclusion: {in: 0...C70[:ru].size}, allow_blank: true
    validates :c71, inclusion: {in: 0...C71[:ru].size}, allow_blank: true
    validates :c76, inclusion: {in: 0...POSITIONS[:ru].size}, allow_blank: true
    validates :c80, inclusion: {in: 0...C80[:ru].size}, allow_blank: true
    validates :c87, inclusion: {in: 0...POSITIONS[:ru].size}, allow_blank: true
    validates :c100, inclusion: {in: 0...C100[:ru].size}, allow_blank: true
  end

end