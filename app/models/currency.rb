class Currency < ApplicationRecord
  DEFAULT_CURRENCY = {
      ru: Currency.where(code: 'RUB').first,
      en: Currency.where(code: 'USD').first
  }
end
