# frozen_string_literal: true

require 'rubygems' if RUBY_VERSION < '1.9'
require 'rest_client'
require 'game_result'

class Game < ApplicationRecord
  validates :user_choice, presence: true

  def set_curb_choice
    response = get_server_response
    self.curb_choice = chosen_bet_by_curb(response) || generate_your_choice
  end

  def find_winner
    self.winner = get_winner
  end

  protected

  BODY = 'body'

  CURB_SERVER_URL = 'https://private-anon-cd340719de-curbrockpaperscissors.apiary-proxy.com/rps-stage/throw'

  TIE = 'nobody'

  WINNER_IS_USER = 'user'

  WINNER_IS_CURB = 'curb'

  BETS = { paper: 'paper',
           rock: 'rock',
           scissors: 'scissors' }.freeze
  BEAT = { paper: 'rock',
           rock: 'scissors',
           scissors: 'paper' }.freeze

  def get_server_response
    response = RestClient.get CURB_SERVER_URL
    JSON.parse response.body
  end

  def chosen_bet_by_curb(response)
    response_body = response[BODY]
    if !!response_body
      response_body.gsub!(/\"/, '')
      BETS[response_body.to_sym]
    end
  end

  def generate_your_choice
    values = BETS.values
    values[rand(values.size)]
  end

  def get_winner
    user_choice.downcase!
    if user_choice == curb_choice
      TIE
    elsif user_beats?
      WINNER_IS_USER
    else
      WINNER_IS_CURB
    end
  end

  def user_beats?
    BEAT[user_choice.to_sym] == curb_choice
  end
end
