require 'rails_helper'

describe BetsController do
  describe 'GET #index' do

    before do
      @bets = FactoryBot.create_list(:bet, 2)
      get :index
    end

    it 'populates an array of all bets' do
      expect(assigns(:bets)).to match_array(@bets)
    end

    it 'returns correct json' do
      response.body.should == @bets.to_json
    end

    it "returns a 200" do
      expect(response).to have_http_status(:ok)
    end

  end
end