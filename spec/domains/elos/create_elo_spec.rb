# frozen_string_literal: true

require 'rails_helper'

module Elos
  describe CreateElo do
    let(:instance) { described_class.new }
    let!(:event) { FactoryBot.create(:event, name: 'foo-event', id: 1) }
    let!(:player1) { FactoryBot.create(:player, name: 'foo', id: 1) }
    let!(:player2) { FactoryBot.create(:player, name: 'bar', id: 2) }
    let!(:current_match) { FactoryBot.create(:match, event_id: 1, winner_id: 1, looser_id: 2, completed_at: Time.now) }

    describe '#call' do
      subject { instance.call(player_id: player_id, level: level, match_id: match_id) }
      context 'parameters are valid' do
        let(:player_id) { player1.id }
        let(:level) { 2 }
        let(:match_id) { current_match.id }
        it 'expected to create an entity' do
          expect { subject }.to change { Elo.count }.by(1)
        end
      end
    end
  end
end
