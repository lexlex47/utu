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
    },
    {
      date: DateTime.strptime('02/11/2019', '%d/%m/%Y'),
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

  describe 'get_price' do
    it 'should return float value' do
      currency.send(:get_price, Record.first)
      expect(currency.get_price).to be_instance_of(Float)
    end
  end

  describe 'get_volume' do
    it 'should return int value' do
      currency.send(:get_volume, Record.first)
      expect(currency.get_volume).to be_instance_of(Integer)
    end
  end

  describe 'get_cap' do
    it 'should return int value' do
      currency.send(:get_cap, Record.first)
      expect(currency.get_cap).to be_instance_of(Integer)
    end
  end

  describe 'get_day_difference' do
    it 'should return float value' do
      currency.send(:get_day_difference, Record.first)
      expect(currency.get_day_difference).to be_instance_of(Float)
    end
    context 'when invalid parameters' do
      it 'should return nil' do
        currency.send(:get_day_difference, Record.last)
        expect(currency.get_day_difference).to be_nil
      end
    end
  end

  describe 'get_week_difference' do
    it 'should return float value' do
      currency.send(:get_week_difference, Record.first)
      expect(currency.get_week_difference).to be_instance_of(Float)
    end
    context 'when invalid parameters' do
      it 'should return nil' do
        currency.send(:get_week_difference, Record.last)
        expect(currency.get_week_difference).to be_nil
      end
    end
  end

  describe 'get_month_difference' do
    it 'should return float value' do
      currency.send(:get_month_difference, Record.first)
      expect(currency.get_month_difference).to be_instance_of(Float)
    end
    context 'when invalid parameters' do
      it 'should return nil' do
        currency.send(:get_month_difference, Record.last)
        expect(currency.get_month_difference).to be_nil
      end
    end
  end

  describe 'cal_difference' do
    context 'when nums1 > nums2' do
      it 'should return negative value' do
        currency.send(:cal_difference, 3.0, 2.0)
        expect(currency.cal_difference).to be <= 0
      end
    end
  end

end