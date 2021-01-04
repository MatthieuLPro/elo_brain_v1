# frozen_string_literal: true

require 'rails_helper'

module Matches
  describe CreateElos do
    let(:instance) { described_class.new }
    let!(:event) { FactoryBot.create(:event, name: 'foo-event', id: 1) }
    let!(:player1) { FactoryBot.create(:player, name: 'foo', id: 1) }
    let!(:player2) { FactoryBot.create(:player, name: 'bar', id: 2) }
    let!(:current_match) { FactoryBot.create(:match, event_id: 1, winner_id: 1, looser_id: 2, completed_at: Time.now) }

    describe '#call' do
      subject { instance.call(match: current_match) }
      context 'parameter is valid' do
        it 'creates 2 new elos value' do
          expect { subject }.to change { Elo.count }.to(2)
        end
      end
    end
  end
end
