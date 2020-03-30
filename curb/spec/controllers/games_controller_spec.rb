require 'rails_helper'

describe GamesController do
  describe 'GET #index' do

    before do
      @games = FactoryBot.create_list(:game, 2)
      get :index
    end

    it 'populates an array of all games' do
      expect(assigns(:games)).to match_array(@games)
    end

    it 'returns correct json' do
      response.body.should == @games.to_json
    end

    it "returns a 200" do
      expect(response).to have_http_status(:ok)
    end

  end

  describe 'POST #create' do
    context "with valid attributes" do
      it 'saves the new game to the db', :vcr do
        expect { post :create, :params => {:game => FactoryBot.attributes_for(:game), :format => :json} }.to change(Game, :count).by(1)
      end

      it "returns a 201" do
        VCR.use_cassette "save game" do
          post :create, :params => {:game => FactoryBot.attributes_for(:game), :format => :json}
          expect(response).to have_http_status(:created)
        end
      end

    end

  end
end