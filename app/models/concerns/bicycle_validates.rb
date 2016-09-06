module BicycleValidates
  extend ActiveSupport::Concern

  C1 = [
      'ru' => %w(BMX горный\ (MTB) горный\ гибрид городской дорожный круизер фэт-байк шоссейный шоссейный\ гибрид),
      'en' => %w(BMX mountain\ (MTB) mountain\ hybrid urban road cruiser fat-bike highway highway\ hybrid),
  ]
  C2 = [
      'ru' => %w(детский подростковый для\ взрослых),
      'en' => %w(children teen adult),
  ]
  C3 = [
      'ru' => %w(вседорожный даунхилл дёрт кросс-кантри стрит трековый триал туринг фрирайд циклокросс),
      'en' => %w(all\ mountain downhill dirt cross\ country street track trial touring freeride cyclocross),
  ]
  C4 = [
      'ru' => %w(от\ 2\ до\ 4\ лет\ ростом\ до\ 105\ см от\ 3\ до\ 5\ лет\ ростом\ до\ 115\ см от\ 4\ до\ 6\ лет\ ростом\ до\ 125\ см от\ 6\ до\ 9\ лет\ ростом\ до\ 135\ см от\ 9\ до\ 15\ лет\ ростом\ до\ 135\ см),
      'en' => %w(2\ -\ 4\ years\ old\ (height\ up\ to\ 105\ cm) 3\ -\ 5\ years\ old\ (height\ up\ to\ 115\ cm) 4\ -\ 6\ years\ old\ (height\ up\ to\ 125\ cm) 6\ -\ 9\ years\ old\ (height\ up\ to\ 135\ cm) 9\ -\ 15\ years\ old\ (height\ up\ to\ 135\ cm)),
  ]
  C5 = [
      'ru' => %w(женский унисекс),
      'en' => %w(female unisex),
  ]
  C7 = [
      'ru' => %w(двухколесный трехколесный четырехколесный),
      'en' => %w(two-wheel three-wheel four-wheel),
  ]
  C14 = [
      'ru' => %w(алюминиевый\ сплав карбон\ (углепластик) карбон/алюминий магниевый\ сплав пластик сталь титановый\ сплав хроммолибденовый\ сплав),
      'en' => %w(aluminium\ alloy carbon carbon/aluminum magnesium\ alloy plastic steel titanium\ alloy chromium-molybdenum\ alloy),
  ]
  C17 = %w(Hard\ tail Rigid\ (жесткий) двухподвесный)
  C18 = %w(начальный прогулочный профессиональный спортивный)
  C20 = %w(воздушная воздушно-масляная жесткая пружинная пружинно-масляная пружинно-эластомерная)
  C33 = %w(алюминиевый\ сплав алюминий/карбон алюминий/скандий карбон\ (углепластик) скандий скандий/карбон сталь)
  C34 = %w(кевлар металл)
  # 41,42,43,44,46,56,58
  LEVELS = %w(начальный полупрофессиональный прогулочный профессиональный спортивный)
  C45 = %w(Bar\ End Dual\ Control Dual\ Drive вращающаяся\ ручка однорычажные триггерные\ двухрычажные триггерные\ однорычажные)
  C47 = %w(интегрированнная неинтегрированнная)
  C48 = %w(Howitzer ISIS Octalink Power\ Spline квадрат)
  C55 = %w(классическая платформы с\ контактами с\ тулклипсами)
  # 57,59
  BREAKS = %w(V-Brake дисковый\ гидравлический дисковый\ механико-гидравлический дисковый\ механический кантиливер клещевой ножной ободной\ гидравлический роллерный отсутствует)
  C60 = %w(вальный ременной цепной)
  C64 = %w(резьбовая безрезьбовая)
  C65 = %w(1\ 1/2\" 1\ 1/4\" 1\ 1/8\" 1\ 1/8\"\ -\ 1\ 1/2\" 1\")
  C66 = %w(интегрированная полуинтегрированная неинтегрированная)
  C69 = %w(изогнутый прямой шоссейный)
  C70 = %w(ванадиевый\ сплав марганцевый\ сплав нихромовый\ сплав сталь титановый\ сплав углепластик хром-кремниевый\ сплав хроммолибденовый\ сплав)
  C71 = %w(искусственная\ кожа кожа кожа\ +\ кевлар пластик синтетическая\ ткань)
  C80 = %w(LFP Li-ion LiMn LiPo SLA)
  C87 = %w(передние задние передние\ и\ задние)

  included do
    validates :c1, inclusion: {in: 0...C1['ru'].size}
    validates :c2, inclusion: {in: 0...C2['ru'].size}
    validates :c3, inclusion: {in: 0...C3['ru'].size}
    validates :c4, inclusion: {in: 0...C4['ru'].size}
    validates :c5, inclusion: {in: 0...C5['ru'].size}
    validates :c7, inclusion: {in: 0...C7['ru'].size}
    validates :c14, inclusion: {in: 0...C14['ru'].size}
    validates :c17, inclusion: {in: 0...C17['ru'].size}
    validates :c18, inclusion: {in: 0...C18['ru'].size}
    validates :c20, inclusion: {in: 0...C20['ru'].size}
    validates :c33, inclusion: {in: 0...C33['ru'].size}
    validates :c34, inclusion: {in: 0...C34['ru'].size}
    validates :c41, inclusion: {in: 0...LEVELS['ru'].size}
    validates :c42, inclusion: {in: 0...LEVELS['ru'].size}
    validates :c43, inclusion: {in: 0...LEVELS['ru'].size}
    validates :c44, inclusion: {in: 0...LEVELS['ru'].size}
    validates :c46, inclusion: {in: 0...LEVELS['ru'].size}
    validates :c56, inclusion: {in: 0...LEVELS['ru'].size}
    validates :c58, inclusion: {in: 0...LEVELS['ru'].size}
    validates :c45, inclusion: {in: 0...C45['ru'].size}
    validates :c47, inclusion: {in: 0...C47['ru'].size}
    validates :c48, inclusion: {in: 0...C48['ru'].size}
    validates :c55, inclusion: {in: 0...C55['ru'].size}
    validates :c57, inclusion: {in: 0...BREAKS['ru'].size}
    validates :c59, inclusion: {in: 0...BREAKS['ru'].size}
    validates :c60, inclusion: {in: 0...C60['ru'].size}
    validates :c64, inclusion: {in: 0...C64['ru'].size}
    validates :c65, inclusion: {in: 0...C65['ru'].size}
    validates :c66, inclusion: {in: 0...C66['ru'].size}
    validates :c69, inclusion: {in: 0...C69['ru'].size}
    validates :c70, inclusion: {in: 0...C70['ru'].size}
    validates :c71, inclusion: {in: 0...C71['ru'].size}
    validates :c80, inclusion: {in: 0...C80['ru'].size}
    validates :c87, inclusion: {in: 0...C87['ru'].size}
  end

end