# frozen_string_literal: true

class CreateRankings < ActiveRecord::Migration[6.0]
  def change
    create_table :rankings do |t|
      t.belongs_to :game, null: false
      t.date :start_date, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.date :end_date, null: false, default: -> { 'CURRENT_TIMESTAMP' }

      t.datetime 'created_at', null: false
    end
  end
end
