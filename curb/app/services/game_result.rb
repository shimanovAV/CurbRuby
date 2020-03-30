# frozen_string_literal: true

class GameResult
  attr_accessor :result
  attr_accessor :description
  attr_accessor :winner_bet

  def initialize(game)
    @game = game
    data_for_initialization = get_initialization_data(@game)
    @result = data_for_initialization[:result]
    @description = data_for_initialization[:description]
    @winner_bet = get_winner_bet
  end

  protected

  def get_winner_bet
    bet_name = @game[:winner] == 'user' ? @game[:user_choice] : @game[:curb_choice]
    bet_name.capitalize!
    Bet.find_by_name(bet_name)
  end

  def get_initialization_data(game)
    data = { nobody: { result: 'Tie!',
                       description: 'Nobody wins' },
             user: { result: 'You won!',
                     description: "Curb with #{game[:curb_choice]} loses" },
             curb: { result: 'You lost!',
                     description: "Curb with #{game[:curb_choice]} wins" } }
    data[game[:winner].to_sym]
  end
end
