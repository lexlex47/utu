class Currency < ApplicationRecord
  
  has_many :records, dependent: :destroy

  attr_accessor :record

  # 获取反馈值
  def get_difference(date)
    record = records.find_by_date(date)
    return nil if record.nil?
    return self.name,
           get_price(record),
           get_day_difference(record),
           get_week_difference(record),
           get_month_difference(record),
           get_volume(record),
           get_cap(record)
  end

  private 
  # 获取close值
  def get_price(record)
    record.close
  end

  # 获取1天的差
  def get_day_difference(record)
    yesterday = record.date - 1.day
    yesterday_record = records.find_by_date(yesterday)
    return nil if yesterday_record.nil?
    cal_difference(record.close,yesterday_record.close)
  end

  # 获取1周的差
  def get_week_difference(record)
    week = record.date - 7.day
    week_record = records.find_by_date(week)
    return nil if week_record.nil?
    cal_difference(record.close,week_record.close)
  end

  # 获取1月的差
  def get_month_difference(record)
    month = record.date - 1.month
    month_record = records.find_by_date(month)
    return nil if month_record.nil?
    cal_difference(record.close,month_record.close)
  end

  # 获取volume的值
  def get_volume(record)
    record.volume
  end

  # 获取market cap的值
  def get_cap(record)
    record.cap
  end

  # 计算两数差百分比
  def cal_difference(num_one,num_two)
    result = (num_one / num_two).round(2).to_f
    num_one > num_two ? result : -result
  end

end
