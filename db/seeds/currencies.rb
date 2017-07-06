def create_currencies
  currencies = Currency.create([
                                   {code: 'RUB', symbol: '₽'},
                                   {code: 'USD', symbol: '$', ratio: '1'},
                                   {code: 'EUR', symbol: '€'}
                               ])
end

create_currencies