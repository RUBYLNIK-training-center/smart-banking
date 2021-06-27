require_relative '../parsers/currency_parser'

namespace :rates do
  desc 'parse currency rates'
  task parse: :environment do
    parser = CurrencyParser.new(url: 'https://www.x-rates.com/table/?from=USD&amount=1')
    rates = parser.parse

    rates.each do |name, value|
      currency = Currency.where(name: name).first_or_initialize
      currency.rate = value
      currency.save
    end
  end
end
