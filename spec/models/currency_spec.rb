require 'rails_helper'

RSpec.describe Currency, type: :model do

  # before(:all) do
  #   Rails.application.load_seed
  # end

  let(:currency) { Currency.new }

  let(:currency_simple) { 
    Currency.create([
    {
      name: "tezos"
    },
    {
      name: "bitcoin"
    }
    ])
  }

  let(:records) {
    Record.create([
    {
      date: DateTime.strptime('2019-12-04', '%Y-%m-%d'),
      open: 1.29,
      high: 1.32,
      low:  1.25,
      close:  1.25,
      volume: 46048752,
      cap:  824588509,
      currency: currency_simple
    },
    {
      date: DateTime.strptime('2019-12-03', '%Y-%m-%d'),
      open: 1.24,
      high: 1.32,
      low:  1.21,
      close:  1.29,
      volume: 41462224,
      cap:  853213342,
      currency: currency_simple
    },
    {
      date: DateTime.strptime('2019-12-02', '%Y-%m-%d'),
      open: 0.768243,
      high: 1.32,
      low:  1.21,
      close:  1.29,
      volume: "27,574,097".to_i,
      cap:  853213342,
      currency: currency_simple
    }
    ])
  }

  describe 'get_difference' do
    
    let(:invalid_value) { currency.get_difference("1") }
    it 'should return nil if no record found' do
      expect(invalid_value).to be_nil
    end

  end

end