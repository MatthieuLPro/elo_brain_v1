# frozen_string_literal: true

class Match < ApplicationRecord
  belongs_to :event
  belongs_to :winner, class_name: 'Player', foreign_key: 'winner_id'
  belongs_to :looser, class_name: 'Player', foreign_key: 'looser_id'

  scope :by_player, ->(id) { where('winner_id = ?', id).or(Match.where('looser_id = ?', id)) }
end
