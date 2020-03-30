require 'rails_helper'


RSpec.describe GameResult do
  before {
    @game = FactoryBot.build(:game, winner: "curb")
    FactoryBot.create(:paper_bet)
    FactoryBot.create(:rock_bet)
    FactoryBot.create(:scissors_bet)
  }

  subject { GameResult.new(@game) }

  it "should check the correctness of the data after initialization" do
    expect(subject.result).to eq 'You lost!'
    expect(subject.description).to eq 'Curb with scissors wins'
    expect(subject.winner_bet.name).to eq 'Scissors'
  end

end