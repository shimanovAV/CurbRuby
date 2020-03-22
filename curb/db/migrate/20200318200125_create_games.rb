# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :user_choice
      t.string :curb_choice
      t.string :winner

      t.timestamps
    end
  end
end
