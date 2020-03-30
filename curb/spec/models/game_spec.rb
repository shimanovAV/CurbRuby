require 'rails_helper'


RSpec.describe Game, :type => :model do
  before do
    allow(subject).to receive(:get_server_response) { Hash["statusCode" => 200,
                                                           "body" => "rock"] }
  end

  subject { FactoryBot.build(:game) }

  it { should validate_presence_of :user_choice }

  it "should get server response during setting of curb choice" do
    expect(subject).to receive(:get_server_response)
    expect(subject).to receive(:chosen_bet_by_curb)
    subject.set_curb_choice
  end

  it "should not generate response during setting of curb choice" do
    expect(subject).not_to receive(:generate_your_choice)
    subject.set_curb_choice
  end

  it "should generate response during setting of curb choice" do
    allow(subject).to receive(:get_server_response) { Hash["statusCode" => 500,
                                                           "body" => "Something went wrong. Please try again later."]
    }
    expect(subject).to receive(:generate_your_choice)
    subject.set_curb_choice
  end

  it 'should set correct curb choice' do
    subject.set_curb_choice
    expect(subject.curb_choice).to eq 'rock'
  end

  it "should get winner while finding him" do
    expect(subject).to receive(:get_winner)
    subject.find_winner
  end

  it 'should find correct winner' do
    subject.find_winner
    expect(subject.winner).to eq 'curb'
  end

end