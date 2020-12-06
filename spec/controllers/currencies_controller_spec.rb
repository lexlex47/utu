require 'rails_helper'

describe CurrenciesController do
  
  describe "#index" do
    
  end

  describe "#search" do
    
    context 'when invalid parameters provided' do
      let(:invalid_attributes){""}
      subject { post :search, params: invalid_attributes }
  
      it 'should return empty json' do
        subject
        expect(json).to include([])
      end
    end

    context 'when valid parameters provided' do
      let(:valid_attributes){"2019-11-10"}
      subject { post :search, params: valid_attributes }
  
      it 'should return empty json' do
        subject
        expect(response).to have_http_status(200)
      end
    end
  end

end