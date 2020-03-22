# frozen_string_literal: true

json.extract! game, :id, :user_choice, :curb_choice, :winner, :created_at, :updated_at
json.url games_url(game, format: :json)
