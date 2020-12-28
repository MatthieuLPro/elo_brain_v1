# frozen_string_literal: true

class InitialMigration < ActiveRecord::Migration[6.0]
  def up
    create_table 'games' do |t|
      t.string :name, null: false
    end

    create_table 'elos' do |t|
      t.belongs_to :player, null: false
      t.belongs_to :match
      t.integer :level, null: false, default: 1_200
    end

    # Need to add start_date
    create_table 'events' do |t|
      t.string :name, null: false
    end

    create_table 'players' do |t|
      t.string :name, null: false
    end

    # Should create association with tournament ?
    create_table 'matches' do |t|
      t.belongs_to :event, null: false
      t.belongs_to :winner, null: false
      t.belongs_to :looser, null: false
    end
  end

  def down
    drop_table :games
    drop_table :elos
    drop_table :events
    drop_table :players
    drop_table :matches
  end
end
