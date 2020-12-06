class CurrenciesController < ApplicationController

  def index
  end

  def search
    date = params[:search]
    @currency_data = []
    Currency.all.each do |currency|
      data = currency.get_difference(date)
      @currency_data << data if !data.nil?
    end
    @currency_data.sort_by!{|data| -data[6] }
    render json: {
      currencies: @currency_data
    }
  end

end