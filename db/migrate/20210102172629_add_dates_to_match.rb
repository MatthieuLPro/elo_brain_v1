# frozen_string_literal: true

class AddDatesToMatch < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :completed_at, :timestamp, null: false
  end
end
