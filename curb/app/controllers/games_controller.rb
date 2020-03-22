# frozen_string_literal: true

class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)
    @game.set_curb_choice
    @game.find_winner

    respond_to do |format|
      if @game.save
        @game_result = GameResult.new(user_choice: @game.user_choice,
                                      curb_choice: @game.curb_choice,
                                      winner: @game.winner)
        format.json { render :show, status: :created }
      else
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def game_params
    params.require(:game).permit(:user_choice)
  end
end
