# frozen_string_literal: true

json.extract! game_result, :result, :description
json.winner_bet do
  json.name game_result.winner_bet.name
  json.photo_url game_result.winner_bet.photo_url
end
json.url games_url(game_result, format: :json)
