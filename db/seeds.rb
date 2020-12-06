# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# currencies = Currency.create([
#   {
#     name: "tezos"
#   },
#   {
#     name: "bitcoin"
#   }
# ])

# records = Record.create([
#   {
#     date: DateTime.strptime('2019/12/04', '%Y/%m/%d'),
#     open: 1.29,
#     high: 1.32,
#     low:  1.25,
#     close:  1.25,
#     volume: 46048752,
#     cap:  824588509,
#     currency: currencies.first
#   },
#   {
#     date: DateTime.strptime('2019/12/03', '%Y/%m/%d'),
#     open: 1.24,
#     high: 1.32,
#     low:  1.21,
#     close:  1.29,
#     volume: 41462224,
#     cap:  853213342,
#     currency: currencies.first
#   },
#   {
#     date: DateTime.strptime('2019/12/02', '%Y/%m/%d'),
#     open: 0.768243,
#     high: 1.32,
#     low:  1.21,
#     close:  1.29,
#     volume: "27,574,097".to_i,
#     cap:  853213342,
#     currency: currencies.first
#   }
# ])

# 处理csv文件
require 'csv' 

@month = {
  "Jan" => "01",
  "Feb" => "02",
  "Mar" => "03",
  "Apr" => "04",
  "May" => "05",
  "Jun" => "06",
  "Jul" => "07",
  "Aug" => "08",
  "Sep" => "09",
  "Oct" => "10",
  "Nov" => "11",
  "Dec" => "12"
}

def reload_data
  # Record.delete_all
  # Currency.delete_all
end

# 处理日期时间
def fetch_date(input)
  input = input.split('-')
  year = "20" + input[-1]
  month = @month[input[1]]
  day = input[0].length > 1 ? input[0] : "0"+input[0]
  date = DateTime.strptime([year,month,day].join('/'), '%Y/%m/%d')
  date
end

# 处理大整数
def fetch_bigint(input)
  data = input.delete ","
  data.to_i
end

# 处理float数
def fetch_float(input)
  data = input.delete ","
  data.to_f
end

# 加载csv文件，创建对应实例至数据库
def load_csv  
  CSV.foreach('crypto_historical_data.csv', :headers => true) do |row|
    currency_name = row[0]
    currency = Currency.find_by_name(currency_name)
    currency = Currency.create(name: currency_name) if currency.nil?
    date = fetch_date(row[1])
    open = fetch_float(row[2])
    high = fetch_float(row[3])
    low = fetch_float(row[4])
    close = fetch_float(row[5])
    volume = fetch_bigint(row[6])
    cap = fetch_bigint(row[7])
    Record.create(date: date, 
                  open: open,
                  high: high, 
                  low: low, 
                  close: close, 
                  volume: volume, 
                  cap: cap, 
                  currency: currency)
  end
end

load_csv



