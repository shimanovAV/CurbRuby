# frozen_string_literal: true

json.extract! bet, :id, :name, :photo_url, :created_at, :updated_at
json.url bets_url(bet, format: :json)
