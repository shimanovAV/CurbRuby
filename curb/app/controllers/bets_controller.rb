# frozen_string_literal: true

class BetsController < ApplicationController
  # GET /bets
  # GET /bets.json
  def index
    @bets = Bet.all
    render json: @bets
  end
end
