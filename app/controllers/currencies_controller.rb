class CurrenciesController < ApplicationController

  def index
  end

  # handle search request
  def search
    date = params[:search]
    @currency_data = []
    Currency.all.each do |currency|
      data = currency.get_difference(date)
      @currency_data << data if !data.nil?
    end
    # sort data in decrease order
    @currency_data.sort_by!{|data| -data[6] }
    # return json
    render json: {
      currencies: @currency_data
    }
  end

end