namespace :load do
  task :currency => :environment do
    data = JSON.load(open('http://api.fixer.io/latest?base=USD'))

    if data
      rates = data['rates']

      rates.each do |rate|
        currency = Currency.where(code: rate[0])

        if currency.size > 0
          currency = currency.first
          currency.ratio = rate[1]
          currency.save
        end
      end
    end
  end
end
