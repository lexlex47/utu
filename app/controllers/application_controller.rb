class ApplicationController < ActionController::Base

  # before_action :reload_data
  # before_action :load_csv

  # @month = {
  #   "Jan" => "01",
  #   "Feb" => "02",
  #   "Mar" => "03",
  #   "Apr" => "04",
  #   "May" => "05",
  #   "Jun" => "06",
  #   "Jul" => "07",
  #   "Aug" => "08",
  #   "Sep" => "09",
  #   "Oct" => "10",
  #   "Nov" => "11",
  #   "Dec" => "12"
  # }

  # def reload_data
  #   # Record.delete_all
  #   # Currency.delete_all
  # end

  # def load_csv  
  #   CSV.foreach('crypto_historical_data.csv', :headers => true) do |row|
  #     currency_name = row[0]
  #     currency = Currency.find_by_name(currency_name)
  #     currency = Currency.create(name: currency_name) if currency.nil?
  #     date = fetch_date(input)
  #     high = row[2]
  #     low = row[3]
  #     close = row[4]
  #     volume = fetch_bigint(input)
  #     cap = fetch_bigint(input)
  #     Record.create(date: date, 
  #                   high: high, 
  #                   low: low, 
  #                   close: close, 
  #                   volume: volume, 
  #                   cap: cap, 
  #                   currency: currency)
  #   end
  # end

  # private

  # def fetch_date(input)
  #   input = input.split('-')
  #   year = "20" + input[-1]
  #   month = @month[input[1]]
  #   day = input[0].length > 1 ? input[0] : "0"+input[0]
  #   date = DateTime.strptime([year,month,day].join('/'), '%Y/%m/%d')
  #   date
  # end

  # def fetch_bigint(input)
  #   data = input.delete ","
  #   data.to_i
  # end

end
