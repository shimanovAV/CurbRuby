# frozen_string_literal: true
class CreateBets < ActiveRecord::Migration[6.0]
  def change
    create_table :bets do |t|
      t.string :name
      t.string :photo_url

      t.timestamps
    end
  end
end
